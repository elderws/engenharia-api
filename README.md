# 📐 API de Cálculos para Engenharia Civil

Esta é uma API RESTful desenvolvida em **Node.js** com banco de dados **MySQL**, destinada a realizar cálculos de engenharia civil e armazenar histórico por usuário. Estruturada com controllers e rotas modulares, a API está pronta para ser integrada a aplicativos mobile ou web.

---

## 📁 Estrutura do Projeto

```
engenharia-api/
├── controllers/           # Lógica de negócio dos cálculos e histórico
│   ├── calcularController.js
│   └── historicoController.js
├── routes/                # Definição das rotas da API
│   ├── auth.js
│   ├── calcular.js
│   └── historico.js
├── db.js                  # Conexão com banco de dados MySQL
├── index.js               # Arquivo principal da aplicação
├── dump/                  # Scripts SQL do banco de dados
│   └── engenharia_app.sql
├── package.json
└── README.md
```

---

## 🚀 Tecnologias Utilizadas

* Node.js + Express
* MySQL
* Bcryptjs (para senhas seguras)
* CORS e Body-Parser
* Postman (para testes)

---

## 🔧 Configuração do Banco de Dados

O script completo para criação do banco está no arquivo:

```
dump/engenharia_app.sql
```

Esse script contém a estrutura completa das tabelas:

* `usuarios`
* `tipos_calculo`
* `historico_calculos`

E também os dados iniciais dos tipos de cálculo.

Você pode executar esse script via phpMyAdmin ou diretamente no MySQL com:

```bash
mysql -u root -p engenharia_app < dump/engenharia_app.sql
```

---

## 🧠 Funcionalidades

### Auth

* `POST /cadastrar` → Cria um novo usuário com senha criptografada
* `POST /login` → Faz login e retorna dados do usuário

### Cálculos

* `POST /calcular` → Envia dados do cálculo, processa, salva no histórico e retorna o resultado

### Histórico

* `GET /historico/:usuario_id` → Retorna todos os cálculos feitos por determinado usuário

---

## 📦 Instalação e Execução

```bash
# Clone o repositório
git clone https://github.com/elderws/engenharia-api.git
cd engenharia-api

# Instale as dependências
npm install

# Inicie o servidor
node index.js
```

A API estará rodando em: `http://localhost:3000/`

---

## 🧪 Exemplos de Testes (Postman)

### Cadastro

```json
POST /cadastrar
{
  "nome": "João",
  "email": "joao@email.com",
  "senha": "123456"
}
```

### Login

```json
POST /login
{
  "email": "joao@email.com",
  "senha": "123456"
}
```

### Cálculo - Exemplo (Peso bloco)

```json
POST /calcular
{
  "usuario_id": 1,
  "tipo_calculo_id": 4,
  "dados_entrada": {
    "volume": 0.02,
    "densidade": 2400
  }
}
```

### Histórico

```http
GET /historico/1
```

---

## 📌 Observações Finais

* Todos os cálculos possuem validação de dados e mensagens claras de erro
* Os resultados são salvos em `historico_calculos` vinculados ao usuário
* Pronto para ser integrado com app Android (Java) ou Flutter

---

## 📚 Licença

Este projeto está sob licença MIT - fique à vontade para usar, modificar e contribuir.
