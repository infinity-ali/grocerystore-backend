import jwt from 'jsonwebtoken'
import config from '../config/config.js';
import nodemailer from 'nodemailer'
import otpGenerator from 'otp-generator'

// **************************
// sign jwt token
// **************************

let jwtConfig = {
    jwtOptions: {
        'secretOrKey': config.jwtOptions.secretOrKey || process.env.secretOrKey,
        'ignoreExpiration': config.jwtOptions.ignoreExpiration || process.env.ignoreExpiration
    }
}

const signLoginData = (userInfo) => {
    return new Promise((resolve, reject) => {
        var token = jwt.sign(userInfo, jwtConfig.jwtOptions.secretOrKey, { expiresIn: 30 })
        return resolve(token)
    })
}

const verifyEmail = (input) => {
    return new Promise((resolve, reject) => {
        var otp = otpGenerator.generate(6, { upperCaseAlphabets: false, specialChars: false, lowerCaseAlphabets: false });
        var user = input.name;
        var receiver = input.email;
        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'testinfinity.100@gmail.com',
                pass: 'ihndtbkytdtghuwn'
            }
        });

        var mailOptions = {
            from: 'testinfinity.100@gmail.com',
            to: `${receiver}`,
            subject: 'Test Subject',
            text: `Hi! ${user}
Your OTP code is

                            ${otp}
`
        };

        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                return reject(error)
            } else {
                return resolve(otp)
            }
        });
    });
}

export default {
    signLoginData,
    verifyEmail
};