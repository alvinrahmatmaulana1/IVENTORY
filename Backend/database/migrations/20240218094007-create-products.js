'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Products', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      kode_barang: {
        type: Sequelize.STRING,
        defaultValue: Sequelize.UUIDV4,
        allowNull:false
      },
      image_barang: {
        type: Sequelize.STRING,
        allowNull: false
      },
      nama_barang: {
        type: Sequelize.STRING,
        allowNull: false
      },
      harga: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      stok: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Products');
  }
};