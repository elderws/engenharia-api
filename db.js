// db.js
const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'engenharia_app'
});

db.connect((err) => {
  if (err) {
    console.error('❌ Erro ao conectar no banco:', err.message);
  } else {
    console.log('🟢 Conectado ao MySQL com sucesso!');
  }
});

module.exports = db;
