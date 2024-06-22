'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Laporan_Keluars extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Laporan_Keluars.belongsTo(models.Products, {foreignKey: 'products_id'});
      Laporan_Keluars.belongsTo(models.Users, {foreignKey: 'users_id'});
      Laporan_Keluars.belongsTo(models.Transaksi_Keluars, {foreignKey: 'transaksi_keluars_id'});
    }
  }
  Laporan_Keluars.init({
    products_id: DataTypes.INTEGER,
    users_id: DataTypes.INTEGER,
    transaksi_keluars_id: DataTypes.INTEGER,
    pendapatan: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Laporan_Keluars',
  });
  return Laporan_Keluars;
};