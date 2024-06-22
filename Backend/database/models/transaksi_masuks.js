'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transaksi_Masuks extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Transaksi_Masuks.hasMany(models.Laporan_Masuks,{foreignKey:'transaksi_masuks_id'});
      Transaksi_Masuks.belongsTo(models.Products, {foreignKey: 'product_id'});
      Transaksi_Masuks.belongsTo(models.Users, {foreignKey: 'user_id'});
    }
  }
  Transaksi_Masuks.init({
    tanggal_masuk: DataTypes.DATEONLY,
    product_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER,
    jumlah_masuk: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Transaksi_Masuks',
  });
  return Transaksi_Masuks;
};