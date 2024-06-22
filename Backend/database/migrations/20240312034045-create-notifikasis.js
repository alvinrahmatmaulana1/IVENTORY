'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Notifikases', {
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
      pesan: {
        type: Sequelize.STRING,
        allowNull: false
      },
      tanggal_notifikasi: {
        type: Sequelize.DATE,
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
    await queryInterface.addIndex('Notifikases',['products_id']);
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Notifikases');
    await queryInterface.dropTable('Products');
  }
};