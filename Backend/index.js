const express = require('express')
const app = express()
const cors = require('cors')
const routes = require('./routes')
const bodyParser = require('body-parser')
require("dotenv").config()

app.use(cors({
  origin: ["http://localhost:5173", "http://localhost:56168"],
  credentials: true,
  
}));

app.use(bodyParser.urlencoded({extended:
false}))
app.use(bodyParser.json())
app.use('/uploads/produk', express.static('public/uploads/produk'));
app.use(express.urlencoded({extended: true})); 
app.use(express.json());
app.use(routes);

const server = app.listen(process.env.APP_PORT, () => console.log(`Api Running in Port ${process.env.APP_PORT}`))

process.on('SIGTERM', () => {
  console.info('SIGTERM signal received.');
  console.log('Closing http server.');
  server.close(() => {
    console.log('Http server closed.');
    process.exit(0);
  });
});