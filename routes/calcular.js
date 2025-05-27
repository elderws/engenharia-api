const express = require('express');
const router = express.Router();
const calcularController = require('../controllers/calcularController');

router.post('/', calcularController.realizarCalculo);

module.exports = router;
