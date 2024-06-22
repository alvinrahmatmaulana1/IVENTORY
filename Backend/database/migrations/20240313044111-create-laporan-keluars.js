'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Laporan_Keluars', {
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
      transaksi_keluars_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'Transaksi_Keluars',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      pendapatan: {
        type: Sequelize.INTEGER
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
    await queryInterface.addIndex('Laporan_Keluars',['products_id']);
    await queryInterface.addIndex('Laporan_Keluars',['users_id']);
    await queryInterface.addIndex('Laporan_Keluars',['transaksi_keluars_id']);
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Laporan_Keluars');
    await queryInterface.dropTable('Products');
    await queryInterface.dropTable('Users');
    await queryInterface.dropTable('Transaksi_Keluars');
  }
};