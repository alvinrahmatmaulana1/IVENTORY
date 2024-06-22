'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Products extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Products.hasMany(models.Transaksi_Masuks,{foreignKey:'product_id'});
      Products.hasMany(models.Transaksi_Keluars,{foreignKey:'products_id'});
      Products.hasMany(models.Laporan_Masuks,{foreignKey:'products_id'});
      Products.hasMany(models.Laporan_Keluars,{foreignKey:'products_id'});
    }
  }
  Products.init({
    kode_barang: DataTypes.STRING,
    image_barang: DataTypes.STRING,
    nama_barang: DataTypes.STRING,
    harga: DataTypes.INTEGER,
    stok: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Products',
  });
  return Products;
};