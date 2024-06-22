const db = require("../database/models")

const Notifikases = db.Notifikasis;

const index = async (req, res) => {
    try {
        const result = await Notifikases.findAndCountAll()
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const destroy = (req, res) => {
    let msg
    Notifikases.findByPk(req.params.id).then((row) => {
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

module.exports = {
    index, destroy
}