'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Transaksi_Keluars', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      tanggal_keluar: {
        type: Sequelize.DATEONLY,
        allowNull:false
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
        allowNull: false,
        references: {
          model: 'Users',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      jumlah_keluar: {
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
    await queryInterface.addIndex('Transaksi_Keluars',['products_id']);
    await queryInterface.addIndex('Transaksi_Keluars',['users_id']);
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Transaksi_Keluars');
    await queryInterface.dropTable('Products');
    await queryInterface.dropTable('Users');
  }
};