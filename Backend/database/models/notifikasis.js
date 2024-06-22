'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Notifikasis extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Notifikasis.belongsTo(models.Products, {foreignKey: 'products_id'});
    }
  }
  Notifikasis.init({
    products_id: DataTypes.INTEGER,
    pesan: DataTypes.STRING,
    tanggal_notifikasi: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Notifikasis',
  });
  return Notifikasis;
};