const conn = require('./db/conn')
const { Cliente, Veiculo, Agendamento } = require('./models/rel')
const CryptoJS = require('crypto-js')
const CHAVE_SECRETA = 'segredo'

const criptografar = (valor) => CryptoJS.AES.encrypt(valor, CHAVE_SECRETA).toString()

const clientes = [
    { nome: 'Marcos', email: 'marcos@gmail.com', senha: '123', cpf: '12345678912', endereco: 'Rua das Flores, 123', celular: '48999998888' },
    { nome: 'Ana', email: 'ana@gmail.com', senha: '123', cpf: '22233344455', endereco: 'Av. Brasil, 456', celular: '48988887777' },
    { nome: 'Roberto', email: 'roberto@gmail.com', senha: '123', cpf: '98765432100', endereco: 'Rua Central, 789', celular: '48977776666' },
    { nome: 'Juliana', email: 'juliana@gmail.com', senha: '123', cpf: '11122233344', endereco: 'Rua XV de Novembro, 50', celular: '48966665555' },
    { nome: 'Carlos', email: 'carlos@gmail.com', senha: '123', cpf: '55566677788', endereco: 'Av. Beira Mar, 1000', celular: '48955554444' }
]

const veiculos = [
    { modelo: 'Onix', marca: 'Chevrolet', placa: 'ABC1D23', rastreador: 'RST-0001', idCliente: 1 },
    { modelo: 'HB20', marca: 'Hyundai', placa: 'DEF4G56', rastreador: 'RST-0002', idCliente: 2 },
    { modelo: 'Strada', marca: 'Fiat', placa: 'HIJ7K89', rastreador: 'RST-0003', idCliente: 3 },
    { modelo: 'Gol', marca: 'Volkswagen', placa: 'LMN2P34', rastreador: 'RST-0004', idCliente: 4 },
    { modelo: 'Corolla', marca: 'Toyota', placa: 'QRS5T67', rastreador: 'RST-0005', idCliente: 5 },
    { modelo: 'Hilux', marca: 'Toyota', placa: 'UVW8X90', rastreador: 'RST-0006', idCliente: 1 }
]

const agendamentos = [
    { data: '2026-10-25', hora: '14:00:00', tipoServico: 'revisão', idVeiculo: 1, idCliente: 1 },
    { data: '2026-10-05', hora: '10:30:00', tipoServico: 'manutenção', idVeiculo: 2, idCliente: 2 },
    { data: '2026-10-15', hora: '16:00:00', tipoServico: 'instalação', idVeiculo: 3, idCliente: 3 },
    { data: '2026-11-03', hora: '08:00:00', tipoServico: 'revisão', idVeiculo: 4, idCliente: 4 },
    { data: '2026-11-10', hora: '09:30:00', tipoServico: 'instalação', idVeiculo: 5, idCliente: 5 },
    { data: '2026-10-28', hora: '13:00:00', tipoServico: 'manutenção', idVeiculo: 6, idCliente: 1 }
]

async function seedDataBase() {
    try{
        // Recria as tabelas (apaga os dados atuais) antes de popular
        await conn.sync({force: true})

        await Cliente.bulkCreate(clientes.map((el) => ({
            ...el,
            senha: criptografar(el.senha),
            cpf: criptografar(el.cpf)
        })))

        await Veiculo.bulkCreate(veiculos.map((el) => ({
            ...el,
            rastreador: criptografar(el.rastreador)
        })))

        await Agendamento.bulkCreate(agendamentos)

        console.log('Dados inseridos com sucesso!')
    }catch(err){
        console.error('Erro ao inserir dados!',err)
    }finally{
        await conn.close()
        console.log('Fechando conexão com banco de dados!')
    }
}

seedDataBase()
