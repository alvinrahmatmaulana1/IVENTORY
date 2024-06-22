const passwordHash = require('password-hash')
const bcryptjs = require('bcryptjs')
const db = require("../database/models")
const Users = db.Users;



const index = async (req, res) => {
    try {
        const result = await Users.findAndCountAll()
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const createUsers = async (req, res) => {
    try {

        const { username, email, password } = req.body;
        const passwordToSave = passwordHash.generate(req.body.password)
      await Users.create({
        username: username,
        email: email,
        password: passwordToSave,
        role: "pegawai",
      });
      res.status(201).json({ msg: "create user account successfully" });
    } catch (error) {
      res.status(400).json({ msg: error.message });
    }
  };

  const updateUsersById = async (req, res) => {
    try {
      const user = await Users.findOne({
        where: { id: req.params.id },
      });
  
      if (!user) {
        return res.status(404).json({ msg: 'User not found' });
      }
  
      const { username, email, password, role } = req.body;
      const updateFields = {};
  
      if (username) updateFields.username = username;
      if (email) updateFields.email = email;
  
      if (password) {
        const passwordToSave = passwordHash.generate(password);
        updateFields.password = passwordToSave;
      }
  
      if (role) updateFields.role = role;
  
      await Users.update(updateFields, { where: { id: user.id } });
  
      res.status(200).json({ msg: 'User updated successfully' });
    } catch (error) {
      console.error('Error updating user:', error);
      res.status(400).json({ msg: error.message });
    }
  };
  

const show = async (req, res) => {
    try {
        const id = req.params.id
        const data = await Users.findOne({
            where: {
                id: id
            }
        });
        const result = data ? data : `${id} not found in db`
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const destroy = (req, res) => {
    let msg
    Users.findByPk(req.params.id).then((row) => {
        if(row){
            row.destroy()
            msg = "success deleted"
        }else{
            msg = `${req.params.id} not found in db`
        }
        res.json({ message: msg })
    }).catch((err) => {
        res.json({ message: err.message })
    })
}

module.exports = {index , show, createUsers, updateUsersById, destroy}