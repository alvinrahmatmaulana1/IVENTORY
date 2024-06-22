'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Laporan_Masuks', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      products_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Products',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      users_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'Users',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      transaksi_masuks_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'Transaksi_Masuks',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      pengeluaran: {
        type: Sequelize.INTEGER,
        allowNull:false
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
    await queryInterface.addIndex('Laporan_Masuks',['products_id']);
    await queryInterface.addIndex('Laporan_Masuks',['users_id']);
    await queryInterface.addIndex('Laporan_Masuks',['transaksi_masuks_id']);
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Laporan_Masuks');
    await queryInterface.dropTable('Products');
    await queryInterface.dropTable('Users');
    await queryInterface.dropTable('Transaksi_Masuks');
  }
};