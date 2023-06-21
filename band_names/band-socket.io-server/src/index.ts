import express from 'express';
import path from 'path';
import { Server } from "socket.io";
require('dotenv').config()

// App de Express
const app = express()

// Node Server
const server = require('http').createServer(app)
export const io = new Server(server)
require('./sockets/socket')

// Path público
const publicPath = path.resolve(__dirname, '..', 'public')
app.use(express.static(publicPath))

server.listen(process.env.PORT, (err: string | undefined) => {
    if (err) {
        throw new Error(err)
    }
    console.log('Servidor corriendo en puerto', process.env.PORT)
})
