import { io } from '../index';

import { Band } from '../models/band';
import { Bands } from '../models/bands';

const bands = new Bands();

bands.addBand(new Band('Breaking Benjamin'));
bands.addBand(new Band('Bon Jovi'));
bands.addBand(new Band('Héroes del Silencio'));
bands.addBand(new Band('Metallica'));

io.on('connection', (client): void => {
  console.log('Cliente conectado');

  client.emit('active-bands', bands.getBands());

  client.on('disconnect', () => {
    console.log('Cliente desconectado');
  });

  client.on('vote-band', (payload) => {
    bands.voteBand(payload.id);
    io.emit('active-bands', bands.getBands());
  });

  client.on('add-band', (payload) => {
    const newBand = new Band(payload.name);
    bands.addBand(newBand);
    io.emit('active-bands', bands.getBands());
  });

  client.on('delete-band', (payload) => {
    bands.deleteBand(payload.id);
    io.emit('active-bands', bands.getBands());
  });
});
