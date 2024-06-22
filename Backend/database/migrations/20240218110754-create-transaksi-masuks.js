'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Transaksi_Masuks', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      tanggal_masuk: {
        type: Sequelize.DATEONLY,
        allowNull: false
      },
      product_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Products',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'id',
          onDelete: 'CASCADE'
        }
      },
      jumlah_masuk: {
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
    await queryInterface.addIndex('Transaksi_Masuks',['product_id']);
    await queryInterface.addIndex('Transaksi_Masuks',['user_id']);
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Transaksi_Masuks');
    await queryInterface.dropTable('Products');
    await queryInterface.dropTable('Users');
  }
};