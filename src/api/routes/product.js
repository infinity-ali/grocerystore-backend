import { Router } from 'express';
import middlewares from '../middlewares/index.js';
import Logger from '../../loaders/logger.js';
import passport from '../../config/passport.js';
import sequelize from '../../models/index.js';
import initModels from "../../models/init-models.js";
import _ from 'lodash';
import { Container } from 'typedi';
import productService from '../../services/product.js';
import general from '../middlewares/general.js';
import seq from 'sequelize';
import multer from 'multer';
import ProductImages from '../../models/ProductImages.js';
import fs from 'fs';
import AWS from 'aws-sdk';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import Saml from 'passport-saml';

var SamlStrategy = Saml.Strategy;


var storage = multer.diskStorage(
  {
    destination: process.env.imagePath,
    filename: async (req, file, cb) => {
      let name = file.originalname.split('.');
      name[0] = name[0] + '-' + Date.now();
      let fullFileName = '';
      name.forEach(part => {
        if (fullFileName === '') {
          fullFileName = fullFileName + part;
        } else {
          fullFileName = fullFileName + '.' + part;
        }
      })
      cb(null, fullFileName);
    }
  }
);

const upload = multer({
  storage,
  storage: storage,
  fileFilter: (req, file, cb) => {
    if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
      cb(null, true);
    } else if (!file) {
      return;
    } else {
      cb(null, false);
      return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
    }
  }
})

const route = Router();
const model = initModels(sequelize);
const Op = seq.Op;

export default (app) => {

  const logger = Container.get('logger');

  app.use('/product', route);

  route.use((req, res, next) => {
    Logger.debug(`${req.method}: /product${req.url}`);
    next();
  });

  route.get('/uploads3', async (req, res, next) => {

    try {
      // Enter copied or downloaded access ID and secret key here
      const ID = 'AKIAUMTIDEUA6E4QZKIE';
      const SECRET = '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';

      // The name of the bucket that you have created
      const BUCKET_NAME = 'uzairbucket675';

      const s3 = new AWS.S3({
        accessKeyId: ID,
        secretAccessKey: SECRET
      });

      let fileName = "./public/data/uploads/watch-1649846220146.jpeg";

      // Read content from the file
      const fileContent = fs.readFileSync(fileName);

      // Setting up S3 upload parameters
      const params = {
        Bucket: BUCKET_NAME,
        Key: 'cat.jpg', // File name to save in S3
        //Body: fileContent
      };

      // Uploading files to the bucket
      // s3.upload(params, function (err, data) {
      //   if (err) {
      //     throw err;
      //   }
      //   return res.success(data);
      // });

      // s3.getObject(params, function (err, data) {
      //   if (err) console.log(err, err.stack); // an error occurred
      //   else res.success(data);           // successful response
      // });

      // var file = fs.createWriteStream(process.env.imagePath + 'cat.jpeg');
      // s3.getObject(params).createReadStream().pipe(file);
      // res.success(true)

      const signedUrlExpireSeconds = 60 * 5

      const url = s3.getSignedUrl('getObject', {
        Bucket: BUCKET_NAME,
        Key: 'cat.jpg',
        Expires: signedUrlExpireSeconds
      })
      res.success(url)
    }
    catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    }
  });
  route.post('/add', general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, upload.array('uploaded_file', 5), middlewares.validation.postProduct, async (req, res, next) => {

    try {
      let input = req.body;
      input.file = req.files;
      console.log(req.files)

      const model = Container.get('Products');
      const instance = new productService(model, logger);

      const data = await instance.AddProduct(input);

      return res.success(data);
    }
    catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    }
  });
  route.post('/view', middlewares.validation.viewProducts, async (req, res, next) => {
    try {
      let input = req.body;
      const model = Container.get('Products');
      const instance = new productService(model, logger);

      const data = await instance.AllProducts(input);

      return res.success(data);
    } catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    }
  });
  route.get('/view/:id', middlewares.validation.viewSingleProduct, async (req, res, next) => {
    try {
      let input = req.params.id;
      const model = Container.get('Products');
      const instance = new productService(model, logger);

      const data = await instance.SingleProduct(input);

      return res.success(data)
    } catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    }
  });
  route.put('/delete/:id', general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, middlewares.validation.deleteProduct, async (req, res, next) => {
    try {
      let input = {};
      input.id = req.params.id;

      const model = Container.get('Products');
      const instance = new productService(model, logger);

      const data = await instance.RemoveProduct(input);
      return res.success(data);
    } catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    }
  });
  route.put('/update/:id', upload.array('uploaded_file', 5), general.tokenDecrypt, passport.authenticate('jwt', { session: false }), general.searchUser, middlewares.validation.updateProduct, async (req, res, next) => {
    try {
      let input = req.body;
      input.id = req.params.id;
      input.file = req.files;

      console.log(req)

      const model = Container.get('Products');
      const instance = new productService(model, logger);

      const data = await instance.UpdateProduct(input);
      res.success(data);
    } catch (e) {
      logger.error('🔥 error: %o', e);
      return next(e);
    };
  });

  // app.use(
  //   session({
  //     secret: "$$$$",
  //     saveUninitialized: true,
  //     resave: true,
  //     cookie: {
  //       httpOnly: true,
  //       secure: true,
  //       ephimeral: true,
  //     },
  //   })
  // );
  // passport.serializeUser(function (user, done) {
  //   done(null, user);
  // });
  // passport.deserializeUser(function (user, done) {
  //   console.log(user)
  //   done(null, user);
  // });
  // app.use(passport.initialize());
  // app.use(passport.session());

  // app.use(function (req, res, next) {
  //   res.setHeader("Access-Control-Allow-Origin", "callback_url");
  //   res.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE");
  //   res.setHeader(
  //     "Access-Control-Allow-Headers",
  //     "X-Requested-With,content-type"
  //   );
  //   res.setHeader("Access-Control-Allow-Credentials", true);
  //   res.setHeader("X-Frame-Options", "deny");
  //   res.setHeader("Cache-Control", "private, no-cache, no-store");
  //   next();
  // });

  // app.use(cookieParser("$$$$"));

  // passport.use(
  //   new SamlStrategy(
  //     {
  //       callbackUrl: "callbackUrl",
  //       entryPoint: "entryPoint",
  //       issuer: 'issuer',
  //       cert: "cert",
  //       identifierFormat: 'identifierFormat',
  //       decryptionPvk: "decryptionPvk",
  //       protocol: "https://",
  //       privateCert: "privateCert"

  //     },
  //     function (profile, done) {
  //       var user_info = {
  //         name_id: profile.nameID,
  //         email: profile.EMAIL,
  //         manager: profile.Manager,
  //         employee_type: profile.EmployeeType,
  //       };
  //       return done(null, user_info);
  //     }
  //   )
  // );



  // app.post(
  //   "/auth",
  //   passport.authenticate("saml", {
  //     failureRedirect: "/login",
  //     failureFlash: true,
  //   }),
  //   function (req, res) {
  //     res.redirect("/home");
  //   }
  // );

  // var authenticationMiddleWare = function (req, res, next) {
  //   if (typeof req.session.passport !== "undefined") {
  //     console.log(req.session)
  //     res.send("sucess")
  //   } else {
  //     res.send("on login")
  //   }
  // };

  // app.get("/login", function (req, res, next) {
  //   passport.authenticate("saml", {
  //     failureRedirect: "/",
  //     failureFlash: true,
  //   })(req, res, next);
  // });

  // app.use(authenticationMiddleWare);

  // app.use(function (req, res, next) {
  //   if (req.session.passport) {
  //     if (req.session.passport.user.sso_role) {
  //       res.cookie("user_id", req.session.passport.user.id, {
  //         maxAge: 90000,
  //         secure: true,
  //         httpOnly: true,
  //       });
  //     } else {
  //       res.cookie("user_id", "FORBIDDEN", {
  //         maxAge: 90000,
  //         secure: true,
  //         httpOnly: true,
  //       });
  //     }
  //   } else {
  //     res.cookie("user_id", "FORBIDDEN", {
  //       maxAge: 90000,
  //       secure: true,
  //       httpOnly: true,
  //     });
  //   }
  //   next();
  // });

}