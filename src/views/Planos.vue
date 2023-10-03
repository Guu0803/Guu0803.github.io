<template>
    <div class="tela" v-on:click="fecharDropdown()">
        <div class="titulo">
            Pagamento
        </div>
        <div class="grid-conteiners">
            <div class="conteiner" v-if="tab == 'pagamento'">
                Forma de Pagamento
                <div class="planos">
                    Selecione o plano:
                    <div class="dropdown" v-on:click.stop="clicouPlano()">
                        <div class="titulo-dropdown">
                            <div v-if="!planoEscolhido">
                                Escolha
                            </div>
                            {{ planoEscolhido }}
                            <span class="material-icons seta">
                                keyboard_arrow_down
                            </span>
                        </div>
                        <div class="conteudo-dropdown-planos" :style="mostrarPlano()">
                            <p v-on:click="planoMensal()"> Plano Mensal </p>
                            <p v-on:click="planoTri()"> Plano Trimestral</p>
                            <p v-on:click="planoSem()"> Plano Semestral</p>
                            <p v-on:click="planoAnual()"> Plano Anual </p>
                        </div>
                    </div>
                </div>
                <div class="planos">
                    Forma de Pagamento:
                    <div class="dropdown" v-on:click.stop="clicouPagamento()" :style="metodoVazio()">
                        <div class="titulo-dropdown">
                            <div v-if="!metodoEscolhido">
                                Escolha
                            </div>
                            {{ metodoEscolhido }}
                            <span class="material-icons seta">
                                keyboard_arrow_down
                            </span>
                        </div>
                        <div class="conteudo-dropdown-planos" :style="mostrarPagamento()">
                            <p v-on:click="metodoCredito()"> Crédito </p>
                            <p v-on:click="metodoDebito()"> Débito</p>
                            <p v-on:click="metodoPix()"> Pix</p>
                            <p v-on:click="metodoBoleto()"> Boleto </p>
                        </div>
                    </div>
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="voltarInicio()">
                        Voltar
                    </button>
                    <button v-on:click="passarIndex()">
                        Confirmar
                    </button>
                </div>
            </div>

            <div class="conteiner" v-if="tab == 'cartao'">
                Dados do Cartão
                <div class="cartao">
                    <input type="text" maxlength="16" placeholder="Numero do Cartão" v-model="cartao"
                        :style="inputCartaoVazio()" v-on:change="alterarInput()">
                    <div>
                        <input type="text" maxlength='5' placeholder="Vencimento" id="data" v-model="vencimento"
                            :style="inputVencimentoVazio()" v-on:change="alterarInput()">
                        <input type="text" maxlength="3" placeholder="CVV" id="cvv" v-model="cvv" :style="inputCvvVazio()"
                            v-on:change="alterarInput()">
                    </div>
                    <input type="text" placeholder="Nome no Cartão" v-model="nomeCartao" :style="inputNomeCartaoVazio()"
                        v-on:change="alterarInput()">
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="voltarIndex()">
                        voltar
                    </button>
                    <button v-on:click="passarIndexCartao()">
                        Confirmar
                    </button>
                </div>
            </div>

            <div class="conteiner" v-if="tab == 'detalhes'">
                Detalhes do Pedido
                <div class="conteiner-pagamentos">
                    <div class="infos">
                        <div>
                            Plano escolhido:
                        </div>
                        <div>
                            Valor:
                        </div>
                        <div>
                            Forma de pagamento:
                        </div>
                        <div v-if="metodoEscolhido == 'Crédito' || metodoEscolhido == 'Débito'">
                            Nome no Cartão:
                        </div>
                        <div v-if="metodoEscolhido == 'Crédito' || metodoEscolhido == 'Débito'">
                            Final do cartão :
                        </div>
                        <div>
                            Data de Cobrança:
                        </div>
                        <div>
                            Próxima Cobrança:
                        </div>
                    </div>
                    <div class="infos">
                        <div>
                            {{ planoEscolhido }}
                        </div>
                        <div>
                            R$ {{ valor }}
                        </div>
                        <div>
                            {{ metodoEscolhido }}
                        </div>
                        <div v-if="metodoEscolhido == 'Crédito' || metodoEscolhido == 'Débito'">
                            {{ nomeCartao }}
                        </div>
                        <div v-if="metodoEscolhido == 'Crédito' || metodoEscolhido == 'Débito'">
                            {{ finalCartao }}
                        </div>
                        <div>
                            {{ this.data() }}
                        </div>
                        <div>
                            {{ this.dataVencimento() }}
                        </div>
                    </div>
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="voltarIndex()">
                        voltar
                    </button>
                    <button v-on:click="confirmarPagamento()"
                        v-if="metodoEscolhido == 'Crédito' || metodoEscolhido == 'Débito'">
                        Confirmar
                    </button>
                    <button v-on:click="passarIndex2()" v-else>
                        Confirmar
                    </button>
                </div>
            </div>

            <div class="conteiner" v-if="tab == 'pix'">
                Pagamento via Pix
                <div class="pix">
                    <div>
                        Chave pix :
                        <div>
                            444.444.444 - 44
                        </div>
                    </div>
                    <div>
                        Tipo de Chave:
                        <div>
                            CNPJ
                        </div>
                    </div>
                    <div>
                        Nome :
                        <div>
                            SpaceFlix LTDA
                        </div>
                    </div>
                    <div>
                        QR CODE
                        <div class="conteiner-qr-code">
                            <img src="@/assets/qr-code.png">
                        </div>
                    </div>
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="voltarIndex()">
                        voltar
                    </button>
                    <button v-on:click="confirmarPagamento()">
                        Confirmar
                    </button>
                </div>
            </div>

            <div class="conteiner" v-if="tab == 'boleto'">
                Boleto
                <div class="boleto">
                    <div class="file">
                        <span class="material-icons">
                            description
                        </span>
                        <div>
                            boleto-spaceflix.pdf
                            <div style="color: #818181;;">
                                9MB
                            </div>
                        </div>
                    </div>
                    <span class="material-icons ">
                        file_download
                    </span>
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="voltarIndex()">
                        voltar
                    </button>
                    <button v-on:click="confirmarPagamento()">
                        Confirmar
                    </button>
                </div>
            </div>
            <div class="conteiner" v-if="tab == 'pagamento recebido'">
                <span class="material-icons icone-verificado">
                    verified
                </span>
                <div class="pagamento-recebido">
                    Recebemos seu pagamento. <br>
                    Agradecemos a preferência <br>
                    Divirta-se!
                </div>
                <button v-on:click="toLogin()">
                    Confirmar
                </button>
            </div>
        </div>

    </div>
</template>
<script>
export default {
    name: 'paginaPlanos',
    data() {
        return {
            planoEscolhido: '',
            metodoEscolhido: '',
            plano: false,
            pagamento: false,
            index: 0,
            cartao: '',
            nomeCartao: '',
            cvv: '',
            vencimento: '',
            preencheuInputs: false,
            inputCartao: false,
            inputVencimento: false,
            inputCvv: false,
            inputNomeCartao: false,
            finalCartao: '',
            valor: '',
            tab: 'pagamento',
            formaPagamento: true,
            infoPlano: {
                nome: '',
                preco: ''
            },
            tokenAccess: ''
        }
    },
    methods: {
        planoMensal() {
            this.planoEscolhido = 'Mensal'
            this.valor = '25,90'
            this.infoPlano = {
                nome: this.planoEscolhido,
                preco: this.valor
            }

        },
        planoTri() {
            this.planoEscolhido = 'Trimestral'
            this.valor = '65,99'
            this.infoPlano = {
                nome: this.planoEscolhido,
                preco: this.valor
            }

        },
        planoSem() {
            this.planoEscolhido = 'Semestral'
            this.valor = '119.99'
            this.infoPlano = {
                nome: this.planoEscolhido,
                preco: this.valor
            }
        },
        planoAnual() {
            this.planoEscolhido = 'Anual'
            this.valor = '191,99'
            this.infoPlano = {
                nome: this.planoEscolhido,
                preco: this.valor
            }
        },
        metodoCredito() {
            this.metodoEscolhido = 'Crédito'
            this.formaPagamento = true

        },
        metodoDebito() {
            this.metodoEscolhido = 'Débito'
            this.formaPagamento = true

        },
        metodoPix() {
            this.metodoEscolhido = 'Pix'
            this.formaPagamento = true

        },
        metodoBoleto() {
            this.metodoEscolhido = 'Boleto'
            this.formaPagamento = true

        },
        mostrarPlano() {
            if (this.plano == true) {
                return "display:block;"
            }
        },
        clicouPlano() {
            this.pagamento = false
            if (this.plano == false) {
                this.plano = true
            } else {
                this.plano = false
            }
        },
        mostrarPagamento() {
            if (this.pagamento == true) {
                return "display:block;"
            }
        },
        clicouPagamento() {
            this.plano = false
            if (this.pagamento == false) {
                this.pagamento = true
            } else {
                this.pagamento = false
            }
        },
        fecharDropdown() {
            this.pagamento = false
            this.plano = false
        },
        passarIndex() {
            if (this.metodoEscolhido) {
                if (this.metodoEscolhido == 'Crédito' || this.metodoEscolhido == 'Débito') {
                    this.tab = 'cartao'
                } else {
                    this.tab = 'detalhes'
                }
            } else {
                this.formaPagamento = false
            }

        },
        passarIndex2() {
            if (this.tab == 'detalhes' && this.metodoEscolhido == 'Pix') {
                this.tab = 'pix'
            } else {
                this.tab = 'boleto'
            }
        },
        voltarIndex() {
            if (this.tab == 'detalhes' && (this.metodoEscolhido != 'Crédito' || this.metodoEscolhido != 'Débito')) {
                this.tab = 'pagamento'
            }
            if (this.tab == 'cartao') {
                this.tab = 'pagamento'
            }
            if (this.tab == 'pix' || this.tab == 'boleto') {
                this.tab = 'detalhes'
            }
        },
        passarIndexCartao() {
            if (this.cartao && this.vencimento && this.cvv && this.nomeCartao) {
                if (this.cartao.length == 16) {
                    if (this.vencimento.length == 5) {
                        if (this.cvv.length == 3) {
                            if (this.nomeCartao) {
                                this.cartaoAbreviado()
                                this.tab = 'detalhes'
                            } else {
                                this.inputNomeCartao = true
                            }
                        } else {
                            this.inputCvv = true
                        }
                    } else {
                        this.inputVencimento = true
                    }
                } else {
                    this.inputCartao = true
                }
            } else {
                this.preencheuInputs = true
                if (!this.cartao) {
                    this.inputCartao = true
                }
                if (!this.vencimento) {
                    this.inputVencimento = true
                }
                if (!this.cvv) {
                    this.inputCvv = true
                }
                if (!this.nomeCartao) {
                    this.inputNomeCartao = true
                }
            }
        },
        confirmarPagamento() {
            this.tab = 'pagamento recebido'
        },
        cartaoAbreviado() {
            this.finalCartao = this.cartao.slice(12, 16)
        },
        inputCartaoVazio() {
            if (this.inputCartao == true) {
                return "border: 1px solid #f64348;"
            }
        },
        inputNomeCartaoVazio() {
            if (this.inputNomeCartao == true) {
                return "border: 1px solid #f64348;"
            }
        },
        inputCvvVazio() {
            if (this.inputCvv == true) {
                return "border: 1px solid #f64348;"
            }
        },
        inputVencimentoVazio() {
            if (this.inputVencimento == true) {
                return "border: 1px solid #f64348;"
            }
        },
        alterarInput() {
            if (this.vencimento) {
                this.inputVencimento = false
            }
            if (this.cvv) {
                this.inputCvv = false
            }
            if (this.nomeCartao) {
                this.inputNomeCartao = false
            }
            if (this.cartao) {
                this.inputCartao = false
            }
        },
        voltarInicio() {
            this.$router.go(-1)
        },
        metodoVazio() {
            if (this.formaPagamento == false) {
                return "outline:1px solid red"
            }
        },
        data() {
            const novaData = new Date(Date.now()).toLocaleString().split(',')[0];
            return novaData
        },
        dataVencimento() {
            let vencimentos = {
                vencimentoAnual: new Date(Date.now() + (365 * 86400000)).toLocaleString().split(',')[0],
                vencimentoMensal: new Date(Date.now() + (30 * 86400000)).toLocaleString().split(',')[0],
                vencimentoTrimestral: new Date(Date.now() + (90 * 86400000)).toLocaleString().split(',')[0],
                vencimentoSemestral: new Date(Date.now() + (180 * 86400000)).toLocaleString().split(',')[0],
            }
            
            if (this.planoEscolhido == 'Mensal') {
                return vencimentos.vencimentoMensal
            }
            if (this.planoEscolhido == 'Trimestral') {
                return vencimentos.vencimentoTrimestral

            }
            if (this.planoEscolhido == 'Semestral') {
                return vencimentos.vencimentoSemestral
            }
            if (this.planoEscolhido == 'Anual') {
                return vencimentos.vencimentoAnual
            }
        },
        toLogin() {
            let dadosPagamento = {
                plano: this.planoEscolhido,
                vencimento: this.dataVencimento(),
                valor: this.valor,
                metodoEscolhido: this.metodoEscolhido,
                finalCartao: this.finalCartao
            }
            localStorage.setItem('dadosPagamento', JSON.stringify(dadosPagamento))
            if (this.tokenAccess) {
                this.$router.push('/minha-conta')
            } else {
                this.$router.push('/login')
            }
        }
    },
    created() {
        let plano = localStorage.getItem('plano')
        plano = JSON.parse(plano)
        if (plano) {
            this.planoEscolhido = plano.nome
            this.valor = plano.preco
        }
        this.tokenAccess = localStorage.getItem("token")
    }
}
</script>
<style scoped>
.tela {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 3vh;
    font-size: 4vh;
    color: #e8e8e8;
    font-weight: 600;
    gap: 5vh;
    min-height: 65vh;
}

.grid-conteiners {
    display: flex;
    justify-content: center;
    align-items: center;
}

.conteiner {
    background-color: #1f1f1f;
    color: #e8e8e8;
    font-weight: 600;
    width: 35vw;
    height: auto;
    padding: 2vw;
    border-radius: 10px;
    align-items: center;
    display: flex;
    flex-direction: column;
    gap: 2vh;
    font-size: 3vh;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
}

.titulo-dropdown {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 100%;
    padding: 0 1vh;
    position: relative;
    font-size: 2.5vh;
}

.dropdown {
    position: relative;
    display: inline-block;
    align-items: center;
    font-size: 3vh;
    height: 5vh;
    cursor: pointer;
    width: 12vw;
    color: #e8e8e8;
    font-size: 2vh;
    border-bottom: #353535 1px solid;
    background-color: #353535;

}

.seta {
    position: absolute;
    right: 0;
}

.conteudo-dropdown-planos {
    display: none;
    position: absolute;
    background-color: #353535;
    width: 100%;
    z-index: 1;
    color: #e8e8e8;
    right: 0;

}

.conteudo-dropdown-planos p:hover {
    background-color: #f64348;
}

p {
    margin: 0;
    padding: 1vh;
    text-align: center;
    font-size: 2.5vh;
}

.planos {
    display: flex;
    text-align: center;
    font-size: 3vh;
    align-items: center;
    gap: 1vh;
}

button {
    padding: 1vh;
    background-color: #353535;
    color: #e8e8e8;
    font-size: 3vh;
    border-radius: 10px;
    cursor: pointer;
    font-family: 'Karla', sans-serif;
    font-weight: 600;
    border: none;
    margin-top: 1vh;
    transition: ease-in-out 200ms;

}

button:hover {
    background-color: #f64348;
    transition: ease-in-out 200ms;
}

.conteiner-pagamentos {
    margin-top: 2vh;
    width: 35vw;
    font-size: 3vh;
    display: flex;
    border: #353535 1px solid;
    border-radius: 10px;
    justify-content: space-between;

}

.pix {
    display: flex;
    flex-direction: column;
    gap: 1vh;
    width: 100%;
    padding: 1vh;
}

.pix div:not(:last-child) {
    display: flex;
    align-items: center;
    gap: 1vw;
}

.pix div div {
    font-weight: 100;
}

.pix div:last-child {
    text-align: center;
}

.conteiner-qr-code {
    height: 25vh;
    margin-top: 2vh;
}

img {
    height: 100%;
}

.boleto {
    border: 1px solid #353535;
    border-radius: 10px;
    display: flex;
    padding: 1vh;
    align-items: center;
    font-weight: 200;
    cursor: pointer;
}

.file span,
.boleto span {
    font-size: 5vh;
    cursor: pointer;
}

.file {
    padding: 1vh;
    display: flex;
    gap: 1vh;
    font-size: 2.5vh;
}

.conteiner-pagamentos .infos:not(:last-child) {
    text-align: justify;
}

.infos {
    padding: 1vw;
    display: flex;
    flex-direction: column;
    gap: 1vh;
    color: #e8e8e8;
    text-align: center;
}

.infos div {
    height: 4vh;
}

.cartao {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 2vh;
    width: 75%;
}

.cartao div {
    display: flex;
    gap: 1vw;
    justify-content: center;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type='text'] {
    background-color: #353535;
    padding: 1vh;
    width: 70%;
}

#cvv {
    width: 3vw;
}

#data {
    width: 7vw;
}

.conteiner-botao {
    display: flex;
    gap: 1vw;
}

.icone-verificado {
    font-size: 7vh;
    color: green;
}

.pagamento-recebido {
    text-align: center;
    display: flex;
    flex-direction: column;
    gap: 1vh;
}



@media screen and (max-width:1000px) {
    .grid-conteiners{
        width: 100%;
    }
    .conteiner{
        width: 100%;
        padding: 2vh;
        box-sizing: border-box;
        align-items: unset;
        text-align: center;
    }
    .titulo-dropdown{
        font-size: 0.9em;
    }
    .planos{
        font-size: 0.8em;
        justify-content: center;
        gap: 3vw;
    }
    .seta{
        font-size: 1.6em;
    }
    .dropdown{
        width: 23vw;
    }
    p{
        font-size: 0.9em;
    }
    button{
        font-size: 0.8em;
    }
    .pix{
    }
    .pix div {
        font-size: 0.8em;

    }
    .cartao{
        width: 100%;
    }
    input[type='text']{
        width: 90%;
    }
    #data{
        width: 20vw;
    }
    #cvv{
        width: 15vw;
    }
    .conteiner-qr-code{
        height: 15vh;
    }
    .infos{
        padding: 1vh;
        font-size:0.7em ;
    }
    .conteiner-botao{
        justify-content: center;
    }
    .conteiner-pagamentos{
        width: 100%;
    }
    .icone-verificado{
        font-size: 2em;
    }
    .pagamento-recebido{
        font-size: 0.8em;
    }
}
</style>