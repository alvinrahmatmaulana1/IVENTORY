'use strict';
const passwordHash = require('password-hash');
module.exports = {
  up: async (queryInterface, Sequelize) => {
    const users = [];
      users.push({
        username: `Alvin Rahmat Maulana`,
        email: `alvin12@gmail.com`,
        password: passwordHash.generate(`123456`),
        role:`admin`,
        createdAt: new Date(),
        updatedAt: new Date()
      });
      users.push({
        username: `Septian Dwi`,
        email: `asep12@gmail.com`,
        password: passwordHash.generate(`12345`),
        role:`pegawai`,
        createdAt: new Date(),
        updatedAt: new Date()
      });
    
    return queryInterface.bulkInsert('Users', users, {});
  },
  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Users', null, {
      truncate: true
    });
  }
};