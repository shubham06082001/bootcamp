"use strict"
/** @type {import('sequelize-cli').Migration} */
const Sequelize = require("sequelize")

// sequelize model:generate --name User --attributes id:integer, name:string, email:string, password:string

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("users", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      username: Sequelize.STRING,
      password: Sequelize.STRING,
      role: Sequelize.STRING,
      createdAt: Sequelize.DATE,
      updatedAt: Sequelize.DATE,
    })
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable("users")
  },
}
