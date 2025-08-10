import mongoose from 'mongoose';
import dotenv from "dotenv";

dotenv.config();
const DBConnect = (req, res, next) => {
const mongoUri = process.env.MONGO_URI;
  mongoose.connect(mongoUri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
    .then(() => console.log('Database connected successfully'))
    .catch((err) => console.error('Error while connecting to database:', err));

  next();
}

export default DBConnect;

