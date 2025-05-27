const db = require('../db');

exports.realizarCalculo = (req, res) => {
  const { usuario_id, tipo_calculo_id, dados_entrada } = req.body;

  if (!usuario_id || !tipo_calculo_id || !dados_entrada) {
    return res.status(400).json({ success: false, message: 'Dados incompletos.' });
  }

  let resultado = 'Cálculo não implementado.';

  try {
    const dados = dados_entrada;
    const tipo = parseInt(tipo_calculo_id);

    switch (tipo) {
      case 1: { // Dimensionamento de tubulação
        const { vazao, c, s } = dados;
        const vazaoNum = Number(vazao);
        const cNum = Number(c);
        const sNum = Number(s);

        if ([vazaoNum, cNum, sNum].some(isNaN)) {
          resultado = 'Erro: parâmetros inválidos para tubulação.';
        } else {
          const d = Math.pow((vazaoNum / (0.849 * cNum * Math.sqrt(sNum))), 0.375);
          resultado = `Diâmetro ideal: ${(d * 1000).toFixed(2)} mm`;
        }
        break;
      }

      case 2: { // Carga admissível do solo
        const n_spt = Number(dados.n_spt);
        if (isNaN(n_spt)) {
          resultado = 'Erro: N SPT inválido.';
        } else {
          const carga = n_spt * 5;
          resultado = `Carga admissível: ${carga.toFixed(2)} kN/m²`;
        }
        break;
      }

      case 3: { // Volume
        const largura = Number(dados.largura);
        const altura = Number(dados.altura);
        const profundidade = Number(dados.profundidade);

        if ([largura, altura, profundidade].some(isNaN)) {
          resultado = 'Erro: dimensões inválidas para cálculo de volume.';
        } else {
          const volume = largura * altura * profundidade;
          resultado = `${volume.toFixed(2)} m³`;
        }
        break;
      }

      case 4: { // Peso de bloco
        const volume = Number(dados.volume);
        const densidade = Number(dados.densidade);

        if (isNaN(volume) || isNaN(densidade)) {
          resultado = 'Erro: volume ou densidade inválidos.';
        } else {
          const peso = volume * densidade;
          resultado = `Peso: ${peso.toFixed(2)} kg`;
        }
        break;
      }

      case 5: { // Área de laje
        const comprimento = Number(dados.comprimento);
        const largura = Number(dados.largura);

        if (isNaN(comprimento) || isNaN(largura)) {
          resultado = 'Erro: dimensões inválidas para laje.';
        } else {
          const area = comprimento * largura;
          resultado = `Área: ${area.toFixed(2)} m²`;
        }
        break;
      }

      default:
        resultado = 'Tipo de cálculo não reconhecido.';
    }

    // Salva o cálculo no banco de dados
    db.query(
      'INSERT INTO historico_calculos (usuario_id, tipo_calculo_id, dados_entrada, resultado) VALUES (?, ?, ?, ?)',
      [usuario_id, tipo, JSON.stringify(dados), resultado],
      (err) => {
        if (err) {
          return res.status(500).json({ success: false, message: 'Erro ao salvar cálculo.', erro: err.message });
        }
        res.json({ success: true, resultado });
      }
    );
  } catch (e) {
    console.error('Erro interno:', e);
    res.status(400).json({
      success: false,
      message: 'Erro ao processar os dados.',
      erro: e.message
    });
  }
};
