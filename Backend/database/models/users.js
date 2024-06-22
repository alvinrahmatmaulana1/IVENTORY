'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Users extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Users.hasMany(models.Transaksi_Masuks,{foreignKey:'user_id'});
      Users.hasMany(models.Transaksi_Keluars,{foreignKey:'users_id'});
      Users.hasMany(models.Laporan_Masuks,{foreignKey:'users_id'});
      Users.hasMany(models.Laporan_Keluars,{foreignKey:'users_id'});
    }
  }
  Users.init({
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    role: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Users',
  });
  return Users;
};