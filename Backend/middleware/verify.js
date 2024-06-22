require('dotenv').config()
const jwt = require('jsonwebtoken')
const db = require("../database/models")
const Blacklist = db.Blacklist;
const Users = db.Users
const Transaksi_Masuks = db.Transaksi_Masuks;
const Transaksi_Keluars = db.Transaksi_Keluars;
const Laporan_Masuks = db.Laporan_Masuks;
const Laporan_Keluars = db.Laporan_Keluars;
/**
 *
 *
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
const verifyToken = async (req, res, next) => {
  if (req.headers.authorization) {
    const token = req.headers.authorization.split(' ')[1];

    const checkBlackList = await Blacklist.findOne({ where: { token } });
    if (checkBlackList) {
      return res.status(401).send({
        auth: false,
        message: 'Your token is blacklisted, please login again'
      });
    }

    jwt.verify(token, process.env.JWT_KEY, async (err, decoded) => {
      if (err) {
        return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
      }

      // Assign the decoded token to the request object
      req.userToken = decoded.userToken;

      // Check if the URL contains 'me' and replace it with the actual user ID
      if (req.url.includes('/me')) {
        // Find the user based on the decoded user ID
        const user = await Users.findByPk(decoded.userToken.id);
        const transaksi = await Transaksi_Masuks.findAll({ where: { user_id: decoded.userToken.id } });
        const transaksi2 = await Transaksi_Keluars.findAll({ where: { users_id: decoded.userToken.id } });
        const laporan_masuk = await Laporan_Masuks.findAll({ where: { users_id: decoded.userToken.id } });
        const laporan_keluar = await Laporan_Keluars.findAll({ where: { users_id: decoded.userToken.id } });

        if (!user) {
          return res.status(404).json({ msg: 'User not found' });
        }

        if(!transaksi){
          return res.status(404).json({msg: 'Tidak ada transaksi'})
        }

        if(!transaksi2){
          return res.status(404).json({msg: 'Tidak ada transaksi'})
        }

        if(!laporan_masuk){
          return res.status(404).json({msg: 'Tidak ada laporan'})
        }

        if(!laporan_keluar){
          return res.status(404).json({msg: 'Tidak ada laporan'})
        }


        // Assign the user information to req.user
        req.user = {
          id: user.id,
          username: user.username,
          email: user.email,
          role: user.role
          // Add other user information as needed
        };
        

        // Replace 'me' with the actual user ID
        req.url = req.url.replace('me', decoded.userToken.id.toString());
      }

      next();
    });
  } else {
    res.status(401).send({
      auth: false,
      message: 'Token required'
    });
  }
};

const adminOnly = async (req, res, next) => {
    try {
      // Periksa apakah peran adalah admin
      if (req.userToken.role !== "admin") {
        return res.status(403).json({ msg: "Akses terlarang" });
      }
      next();
    } catch (error) {
      console.error(error);
      res.status(401).json({ msg: "Token tidak valid" });
    }
  };

module.exports = { verifyToken, adminOnly }