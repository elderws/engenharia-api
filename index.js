const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
require('./db'); // inicia conexão
const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// Rotas
app.get('/', (req, res) => res.send('API Engenharia está no ar!'));
app.use('/calcular', require('./routes/calcular'));
app.use('/historico', require('./routes/historico'));

app.listen(port, () => {
  console.log(`🟡 Servidor rodando: http://localhost:${port}`);
});
