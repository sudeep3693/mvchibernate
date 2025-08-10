const express = require("express");
const bodyParser = require("body-parser");
const nodemailer = require("nodemailer");
const cors = require("cors");
const crypto = require("crypto");

const app = express();
app.use(cors());
app.use(bodyParser.json());

let otpStore = {};

const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: "your_email@gmail.com",
        pass: "your_gmail_app_password",
    },
});

app.post("/send-otp", (req, res) => {
    const { email } = req.body;
    if (!email) return res.status(400).json({ message: "Email is required" });

    const otp = crypto.randomInt(100000, 999999).toString(); 
    otpStore[email] = { otp, expiresAt: Date.now() + 5 * 60 * 1000 }; 

    const mailOptions = {
        from: "your_email@gmail.com",
        to: email,
        subject: "Your OTP Code",
        text: `Your OTP code is ${otp}. It will expire in 5 minutes.`,
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: "Failed to send OTP" });
        }
        res.json({ message: "OTP sent successfully" });
    });
});

app.post("/verify-otp", (req, res) => {
    const { email, otp } = req.body;

    const stored = otpStore[email];
    if (!stored) return res.status(400).json({ message: "OTP not found" });

    if (Date.now() > stored.expiresAt) {
        delete otpStore[email];
        return res.status(400).json({ message: "OTP expired" });
    }

    if (stored.otp !== otp) {
        return res.status(400).json({ message: "Invalid OTP" });
    }

    delete otpStore[email];
    res.json({ message: "OTP verified successfully" });
});

