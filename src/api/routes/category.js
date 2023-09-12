import { Router } from 'express';
import middlewares from '../middlewares/index.js';
import Logger from '../../loaders/logger.js';
import passport from '../../config/passport.js';
import _ from 'lodash';
import { Container } from 'typedi';
import categoryService from '../../services/category.js';
import general from '../middlewares/general.js';
import Category from '../../models/Category.js';
import multer from 'multer';

const route = Router();

// var storage = multer.diskStorage(
//     {
//         destination: process.env.imagePath,
//         filename: async (req, file, cb) => {
//             let name = file.originalname.split('.');
//             name[0] = name[0] + '-' + Date.now();
//             let fullFileName = '';
//             name.forEach(part => {
//                 if (fullFileName === '') {
//                     fullFileName = fullFileName + part;
//                 } else {
//                     fullFileName = fullFileName + '.' + part;
//                 }
//             })
//             cb(null, fullFileName);
//         }
//     }
// );

// const upload = multer({
//     storage,
//     storage: storage,
//     fileFilter: (req, file, cb) => {
//         if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
//             cb(null, true);
//         } else if (!file) {
//             return;
//         } else {
//             cb(null, false);
//             return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
//         }
//     }
// })

export default (app) => {

    const logger = Container.get('logger');

    app.use('/product/category', route);

    route.use((req, res, next) => {
        Logger.debug(`${req.method}: /product/category${req.url}`);
        next();
    });
    route.post('/add', general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, /*upload.array('uploaded_file', 1),*/ middlewares.validation.postCategory, async (req, res, next) => {
        try {
            const input = req.body;

            const model = Container.get('Category');
            const instance = new categoryService(model, logger);

            const data = await instance.AddCategory(input);

            return res.success(data);
        } catch (e) {
            logger.error('🔥 error: %o', e);
            return next(e);
        }
    });
    route.post('/view', middlewares.validation.viewCategory, async (req, res, next) => {
        try {
            let input = req.body
            const model = Container.get('Category');
            const instance = new categoryService(model, logger);

            const data = await instance.AllCategories(input);

            return res.success(data);
        } catch (e) {
            logger.error('🔥 error: %o', e);
            return next(e);
        }
    });
    route.get('/view/:id', middlewares.validation.viewSingle, async (req, res, next) => {
        try {
            let input = req.params.id;
            const model = Container.get('Category');
            const instance = new categoryService(model, logger);

            const data = await instance.SingleCategory(input);

            return res.success(data)
        } catch (e) {
            logger.error('🔥 error: %o', e);
            return next(e);
        }
    });
    route.put('/update/:id', general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, middlewares.validation.updateCategory, async (req, res, next) => {

        try {
            let input = req.body;
            input.id = req.params.id;
            input.user = req.user.email;
            const model = Container.get('Category');
            const instance = new categoryService(model, logger);

            const data = await instance.UpdateCategory(input);

            return res.success(data);
        } catch (e) {
            logger.error('🔥 error: %o', e);
            return next(e);
        }
    });
    route.put('/delete/:id', general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, middlewares.validation.deleteCategory, async (req, res, next) => {
        try {
            let id = req.params.id;
            let category = await Category.findOne({
                where: { id }
            });
            if (!category || category.isDeleted === true) {
                let error = new Error();
                error.message = "Category doesn't exist";
                error.name = "permission"
                error.status = 404;
                throw error
            } else {
                const data = { isDeleted: true }
                category.set(data);
                category.save();

                res.success({
                    msg: 'Successfully Deleted'
                });
            }
        } catch (e) {
            logger.error('🔥 error: %o', e);
            return next(e);
        };
    })
}