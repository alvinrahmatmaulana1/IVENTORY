'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transaksi_Keluars extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Transaksi_Keluars.hasMany(models.Laporan_Keluars,{foreignKey:'transaksi_keluars_id'});
      Transaksi_Keluars.belongsTo(models.Products, {foreignKey: 'products_id'});
      Transaksi_Keluars.belongsTo(models.Users, {foreignKey: 'users_id'});
    }
  }
  Transaksi_Keluars.init({
    tanggal_keluar: DataTypes.DATEONLY,
    products_id: DataTypes.INTEGER,
    users_id: DataTypes.INTEGER,
    jumlah_keluar: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Transaksi_Keluars',
  });
  return Transaksi_Keluars;
};