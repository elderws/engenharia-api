const db = require('../db');

exports.listarHistorico = (req, res) => {
  const { usuario_id } = req.params;

  db.query(
    `SELECT h.id, h.dados_entrada, h.resultado, h.criado_em, t.nome AS tipo
     FROM historico_calculos h
     JOIN tipos_calculo t ON t.id = h.tipo_calculo_id
     WHERE h.usuario_id = ?
     ORDER BY h.criado_em DESC`,
    [usuario_id],
    (err, results) => {
      if (err) {
        return res.status(500).json({ success: false, message: 'Erro ao buscar histórico.' });
      }
      res.json({ success: true, historico: results });
    }
  );
};
