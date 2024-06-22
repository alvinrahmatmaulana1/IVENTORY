'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Laporan_Masuks extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Laporan_Masuks.belongsTo(models.Products, {foreignKey: 'products_id'});
      Laporan_Masuks.belongsTo(models.Users, {foreignKey: 'users_id'});
      Laporan_Masuks.belongsTo(models.Transaksi_Masuks, {foreignKey: 'transaksi_masuks_id'});
    }
  }
  Laporan_Masuks.init({
    products_id: DataTypes.INTEGER,
    users_id: DataTypes.INTEGER,
    transaksi_masuks_id: DataTypes.INTEGER,
    pengeluaran: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Laporan_Masuks',
  });
  return Laporan_Masuks;
};