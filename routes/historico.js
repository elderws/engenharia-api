const express = require('express');
const router = express.Router();
const historicoController = require('../controllers/historicoController');

router.get('/:usuario_id', historicoController.listarHistorico);

module.exports = router;
