<template>
    <div class="tela" v-on:click="fecharDropdown()">
        <!-- Conteiner Esquerdo -->
        <div class="conteiner-esquerdo">
            <div class="geral">
                <div class="titulo">
                    Geral
                </div>
                <div class="sub-titulos" v-on:click="assinatura()">
                    Dados da Assinatura
                </div>
                <div class="sub-titulos" v-on:click="preferencia()">
                    Preferências
                </div>
                <div class="sub-titulos" v-on:click="alterarEmail()">
                    Alterar E-mail
                </div>
                <div class="sub-titulos" v-on:click="alterarSenha()">
                    Alterar Senha
                </div>
                <div class="sub-titulos" v-on:click="pagamentos()">
                    Histórico de Pagamentos
                </div>
            </div>
        </div>
        <!-- Fim -->

        <!-- Conteiner direito -->
        <div>
            <!-- Conteiner de Dados da Assinatura -->
            <div class="conteiner-sub-titulos" v-if="tab == 'assinatura'">
                Detalhes da assinatura
                <div class="descricao">
                    Gerencie seu plano de assinatura
                    <div class="plano">
                        Plano {{ dadosPagamento.plano }}
                        <div>
                            R$ {{ dadosPagamento.valor }}
                        </div>
                        <button class="alterar-botao" v-on:click="toPlanos()">
                            Alterar plano
                        </button>
                    </div>
                </div>
                <button v-on:click="cancelarAssinatura()">
                    Cancelar Assinatura
                </button>
            </div>
            <!-- fim -->

            <!-- Conteiner de Preferencias  -->
            <div class="conteiner-sub-titulos" v-if="tab == 'preferencia'">
                Preferências
                <div class="descricao">
                    Configuraçõa de idioma de exibição e vídeo
                </div>
                <div class="idioma">
                    Idioma
                    <div class="titulo-idioma">
                        Exibição
                    </div>
                    <div class="dropdown" v-on:click.stop="clicouIdioma()">
                        {{ idiomaSite }}
                        <div class="conteudo-dropdown-idioma" :style="mostrarIdiomas()">
                            <div class="escrita-dropdown" v-on:click="idiomaIngles()">
                                English (US)
                            </div>
                            <div class="escrita-dropdown" v-on:click="idiomaEspanhol()">
                                Español
                            </div>
                            <div class="escrita-dropdown" v-on:click="idiomaFrances()">
                                Français
                            </div>
                            <div class="escrita-dropdown" v-on:click="idiomaItaliano()">
                                Italiano
                            </div>
                            <div class="escrita-dropdown" v-on:click="idiomaPortugues()">
                                Português (Brasil)
                            </div>
                        </div>
                    </div>
                </div>
                <div class="idioma">
                    Video
                    <div class="titulo-idioma">
                        Áudio
                    </div>
                    <div class="dropdown" v-on:click.stop="clicouAudio()">
                        {{ audioSite }}
                        <div class="conteudo-dropdown-audio" :style="mostrarAudio()">
                            <div class="escrita-dropdown" v-on:click="audioIngles()">
                                English (US)
                            </div>
                            <div class="escrita-dropdown" v-on:click="audioEspanhol()">
                                Español
                            </div>
                            <div class="escrita-dropdown" v-on:click="audioFrances()">
                                Français
                            </div>
                            <div class="escrita-dropdown" v-on:click="audioItaliano()">
                                Italiano
                            </div>
                            <div class="escrita-dropdown" v-on:click="audioPortugues()">
                                Português (Brasil)
                            </div>
                        </div>
                    </div>
                    <div class="titulo-idioma">
                        Legenda
                    </div>
                    <div class="dropdown" v-on:click.stop="clicouLegenda()">
                        {{ legendaSite }}
                        <div class="conteudo-dropdown-legenda" :style="mostrarLegenda()">
                            <div class="escrita-dropdown" v-on:click="legendaIngles()">
                                English (US)
                            </div>
                            <div class="escrita-dropdown" v-on:click="legendaEspanhol()">
                                Español
                            </div>
                            <div class="escrita-dropdown" v-on:click="legendaFrances()">
                                Français
                            </div>
                            <div class="escrita-dropdown" v-on:click="legendaItaliano()">
                                Italiano
                            </div>
                            <div class="escrita-dropdown" v-on:click="legendaPortugues()">
                                Português (Brasil)
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conteudo">
                    <span class="material-icons check-on" v-if="check == true" v-on:click="checado()">
                        toggle_on
                    </span>
                    <span class="material-icons check-off" v-if="check == false" v-on:click="naoChecado()">
                        toggle_off
                    </span>
                    Exibir conteúdo adulto
                </div>
                <div class="conteiner-botoes">
                    <button>
                        Confirmar
                    </button>
                </div>
            </div>
            <!-- Fim -->

            <!-- Conteiner de Email -->
            <div class="conteiner-sub-titulos" v-if="tab == 'email'">
                Alterar E-mail
                <div class="descricao">
                    Altere o e-mail para recceber nossas novidades
                </div>
                <div class="alterar-input">
                    E-mail atual:
                    <div class="alerta"
                    v-if="msg == 'erro email 2'" >
                        Email inválido. Por favor verifique e tente novamente.
                    </div>
                    <input type="email" v-model="emailAtual" :style="emailErrado()" v-on:keyup.enter="confirmarEmail()"
                        v-on:change="limparErro()">
                    Novo E-mail:
                    <div class="alerta" v-if="msg == 'erro email 1'">
                        O novo email não pode ser igual ao anterior.
                    </div>
                    <input type="email" v-model="emailNovo" :style="emailIgual()" v-on:keyup.enter="confirmarEmail()"
                        v-on:change="limparErro()">
                </div>
                <button v-on:click="confirmarNovoEmail()">
                    Confirmar
                </button>
            </div>
            <!-- Fim -->

            <!-- Conteiner de senha-->
            <div class="conteiner-sub-titulos" v-if="tab == 'senha'">
                Alterar senha
                <div class="descricao">
                    Alterar senha para fazer login
                </div>

                <div class="alterar-input">
                    Senha atual:
                    <div class="alerta" v-if="msg == 'erro senha 2'">
                        Senha inválida.Por favor verifique e tente novamente.
                    </div>
                    <div class="conteiner-senha">
                        <input :type="visulalizarSenha(senhaVisivel)" v-model="senhaAtual" :style="senhaErrada()"
                            v-on:keyup.enter="confirmarSenha()">
                        <div class="visibilidade" v-on:click="mostrarSenha()" v-on:change="limparErro()">
                            <span class="material-icons" v-if="senhaVisivel == false">
                                visibility
                            </span>
                            <span class="material-icons" v-if="senhaVisivel == true">
                                visibility_off
                            </span>
                        </div>
                    </div>
                    Nova senha:
                    <div class="alerta" v-if="msg == 'erro senha 1'">
                        A senha nova não pode ser igual a anterior.
                    </div>
                    <div class="conteiner-senha">
                        <input :type="visualizarConfirmarSenha(senhaNovaVisivel)" v-model="senhaNova" :style="senhaIgual()"
                            v-on:keyup.enter="confirmarSenha()">
                        <div class="visibilidade" v-on:click="mostrarSenhaNova()" v-on:change="limparErro()">
                            <span class="material-icons" v-if="this.senhaNovaVisivel == false">
                                visibility
                            </span>
                            <span class="material-icons" v-if="this.senhaNovaVisivel == true">
                                visibility_off
                            </span>
                        </div>
                    </div>
                </div>
                <button v-on:click="confirmarNovaSenha()">
                    Confirmar
                </button>
            </div>
            <!-- Fim -->

            <!-- Histórico de pagamento -->
            <div class="conteiner-sub-titulos" v-if="tab == 'pagamentos'">
                Histórico de pagamento
                <div class="descricao">
                    Detalhes de cobramça
                </div>
                <div class="conteiner-pagamentos">
                    <div class="titulo-pagamentos">
                        Última cobrança:
                        <div class="escrita-pagamentos">
                            {{ this.data() }}
                        </div>
                    </div>
                    <div class="titulo-pagamentos">
                        Sua próxima cobrança:
                        <div class="escrita-pagamentos">
                            {{ dadosPagamento.vencimento }}
                        </div>
                    </div>
                    <div class="titulo-pagamentos">
                        Valor:
                        <div class="escrita-pagamentos">
                            R$ {{ dadosPagamento.valor }}
                        </div>
                    </div>
                    <div class="titulo-pagamentos"
                        v-if="dadosPagamento.metodoEscolhido == 'Crédito' || dadosPagamento.metodoEscolhido == 'Débito'">
                        Informações do cartão:
                        <div class="escrita-pagamentos">
                            {{ dadosPagamento.finalCartao }}
                        </div>
                    </div>
                    <div class="titulo-pagamentos" v-else>
                        Método de pagamento:
                        <div class="escrita-pagamentos">
                            {{ dadosPagamento.metodoEscolhido }}
                        </div>

                    </div>
                </div>
            </div>
            <!-- Fim -->
        </div>
        <!-- Fim -->
        <div class="card-cancelar" v-if="cancelar == true">
            <div class="cancelamento" v-if="confirmacaoCancelamento == true">
                Desejar cancelar sua assinatura?
                <div>
                    <button v-on:click="cancelouAssinatura()">
                        Cancelar Assinatura
                    </button>
                    <button v-on:click="naoCancelou()">
                        Não
                    </button>
                </div>
            </div>
            <div class="cancelamento" v-if="avisoCancelamento == true">
                <div>
                    Sua assinatura foi cancelada com sucesso.
                </div>
                <div>
                    Aproveite até :
                    <div style="border-bottom:1px solid #e8e8e8 ">
                        {{ dadosPagamento.vencimento }}
                    </div>
                </div>
                Ou renove sua assinatura!
                <div>
                    <button v-on:click="toPlanos()">
                        Renovar Assinatura
                    </button>
                    <button v-on:click="naoCancelou()">
                        Ok
                    </button>
                </div>
            </div>
        </div>
        <alerta v-if="aviso == true" />
        <div class="conteiner-aviso" v-if="confirmaçaoSenha == true">
            <div class="aviso">
                Senha alterada com sucesso
                <button v-on:click="fecharAviso()">
                    Fechar
                </button>
            </div>
        </div>
        <div class="conteiner-aviso" v-if="confirmacaoEmail == true">
            <div class="aviso">
                Email alterada com sucesso
                <button v-on:click="fecharAviso()">
                    Fechar
                </button>
            </div>
        </div>

    </div>
</template>
<script>
import alerta from '@/components/msgAlerta.vue'
export default {
    components: {
        alerta
    },
    data() {
        return {
            tab: "assinatura",
            idioma: false,
            audio: false,
            legenda: false,
            check: false,
            cancelar: false,
            avisoCancelamento: false,
            confirmacaoCancelamento: true,
            aviso: false,
            audioSite: 'Português (Brasil)',
            idiomaSite: 'Português (Brasil)',
            legendaSite: 'Português (Brasil)',
            user: {},
            senhaVisivel: false,
            senhaNovaVisivel: false,
            senhaAtual: '',
            senhaNova: '',
            emailAtual: '',
            emailNovo: '',
            confirmaçaoSenha: false,
            confirmacaoEmail: false,
            msg: ''
        }
    },
    methods: {
        idiomaEspanhol() {
            this.idiomaSite = 'Español'
        },
        idiomaFrances() {
            this.idiomaSite = 'Français'
        },
        idiomaIngles() {
            this.idiomaSite = 'English (US)'
        },
        idiomaItaliano() {
            this.idiomaSite = 'Italiano'
        },
        idiomaPortugues() {
            this.idiomaSite = 'Português (Brasil)'
        },
        legendaEspanhol() {
            this.legendaSite = 'Español'
        },
        legendaFrances() {
            this.legendaSite = 'Français'
        },
        legendaIngles() {
            this.legendaSite = 'English (US)'
        },
        legendaItaliano() {
            this.legendaSite = 'Italiano'
        },
        legendaPortugues() {
            this.legendaSite = 'Português (Brasil)'
        },
        audioEspanhol() {
            this.audioSite = 'Español'
        },
        audioFrances() {
            this.audioSite = 'Français'
        },
        audioIngles() {
            this.audioSite = 'English (US)'
        },
        audioItaliano() {
            this.audioSite = 'Italiano'
        },
        audioPortugues() {
            this.audioSite = 'Português (Brasil)'
        },
        assinatura() {
            this.tab = "assinatura"
        },
        preferencia() {
            this.tab = "preferencia"
        },
        alterarEmail() {
            this.tab = "email"
        },
        alterarSenha() {
            this.tab = "senha"
        },
        pagamentos() {
            this.tab = "pagamentos"
        },
        metodosPagamentos() {
            this.tab = "metodos"
        },
        clicouIdioma() {
            if (this.idioma == false) {
                this.idioma = true
            } else {
                this.idioma = false
            }
        },
        mostrarIdiomas() {
            if (this.idioma == true) {
                return "display:block;"
            }
        },
        clicouAudio() {
            if (this.audio == false) {
                this.audio = true
            } else {
                this.audio = false
            }
        },
        mostrarAudio() {
            if (this.audio == true) {
                return "display:block;"
            }
        },
        fecharDropdown() {
            this.audio = false
            this.legenda = false
            this.idioma = false

        },
        clicouLegenda() {
            if (this.legenda == false) {
                this.legenda = true
            } else {
                this.legenda = false
            }
        },
        mostrarLegenda() {
            if (this.legenda == true) {
                return "display:block;"
            }
        },
        checado() {
            this.check = false
        },
        naoChecado() {
            this.check = true
        },
        toPlanos() {
            this.$router.push('/planos')
        },
        cancelarAssinatura() {
            this.cancelar = true
        },
        cancelouAssinatura() {
            this.avisoCancelamento = true
            this.confirmacaoCancelamento = false
        },
        naoCancelou() {
            this.cancelar = false

        },
        data() {
            const novaData = new Date(Date.now()).toLocaleString().split(',')[0];
            return novaData
        },
        mostrarSenha() {
            if (this.senhaVisivel == false) {
                this.senhaVisivel = true
            } else {
                this.senhaVisivel = false
            }
        },
        mostrarSenhaNova() {
            if (this.senhaNovaVisivel == false) {
                this.senhaNovaVisivel = true
            } else {
                this.senhaNovaVisivel = false
            }
        },
        visulalizarSenha(senhaVisiel) {
            if (senhaVisiel == true) {
                return "text"
            } else {
                return "password"
            }
        },
        visualizarConfirmarSenha(senhaNovaVisivel) {
            if (senhaNovaVisivel == true) {
                return "text"
            } else {
                return "password"
            }
        },
        confirmarSenha() {
            this.confirmarNovaSenha()
        },
        confirmarEmail() {
            this.confirmarNovoEmail()
        },
        confirmarNovaSenha() {
            if (this.senhaAtual == this.user.password) {
                if (this.senhaAtual != this.senhaNova) {
                    this.confirmaçaoSenha = true
                } else {
                    this.msg = 'erro senha 1'
                }
            } else {
                this.msg = 'erro senha 2'
            }
        },
        confirmarNovoEmail() {
            if (this.emailAtual == this.user.email) {
                if (this.emailAtual != this.emailNovo) {
                    this.confirmacaoEmail = true
                } else {
                    this.msg = 'erro email 1'
                }
            } else {
                this.msg = 'erro email 2'
            }
        },
        limparErro() {
            this.msg = ''
        },
        fecharAviso() {
            this.confirmacaoEmail = false
            this.confirmaçaoSenha = false
            this.msg = ''
            this.emailAtual = ''
            this.emailNovo = ''
            this.senhaAtual = ''
            this.senhaNova = ''
        },
        senhaErrada() {
            if (this.msg == 'erro senha 2') {
                return "outline: 1px solid red;"
            }
        },
        senhaIgual() {
            if (this.msg == 'erro senha 1') {
                return "outline: 1px solid red;"
            }
        },
        emailErrado() {
            if (this.msg == 'erro email 2') {
                return "outline: 1px solid red;"
            }
        },
        emailIgual() {
            if (this.msg == 'erro email 1') {
                return "outline: 1px solid red;"
            }
        }

    },
    created() {
        this.tokenAccess = localStorage.getItem("token")
        if (this.tokenAccess) {
            const axios = require('axios')
            let endereço = "https://easy-password.up.railway.app/account/me/"
            let header = { authorization: "Bearer " + this.tokenAccess }
            let config = { headers: header }
            axios.get(endereço, config).then(response => {
                console.log(response)
            }).catch(error => {
                if (error) {
                    this.$router.push('/login')
                    localStorage.removeItem('usuarioLogado')
                    localStorage.removeItem('token')
                    

                }
            })
        } else {
            this.aviso = true
        }
        let plano = localStorage.getItem('plano')
        plano = JSON.parse(plano)
        if (plano) {
            this.planoEscolhido = plano.nome
            this.valor = plano.preco
        } else {
            this.planoEscolhido = ''
            this.valor =   ''
        }
        let dadosPagamento = localStorage.getItem('dadosPagamento')
        dadosPagamento = JSON.parse(dadosPagamento)
        if (dadosPagamento) {
            this.dadosPagamento = dadosPagamento
        } else {
            this.dadosPagamento = {
                plano: 'Mensal',
                vencimento: '18/12/2023',
                valor:'25.90',
                metodoEscolhido: 'Crédito',
                finalCartao: '1308'
            }
        }
        let user = localStorage.getItem('user')
        user = JSON.parse(user)
        if (user) {
            this.user = user
        }
    }
}
</script>
<style scoped>
.tela {
    display: flex;
    justify-content: center;
    letter-spacing: 1.5px;
    align-items: center;
    height: 80vh;
    width: 100%;
    gap: 5vw;
    position: relative;
}

.card-cancelar {
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.cancelamento {
    width: fit-content;
    height: fit-content;
    background-color: #1f1f1f;
    color: #e8e8e8;
    font-size: 3vh;
    padding: 2vw;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    gap: 2vh;
    text-align: center;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
    position: absolute;
}

.cancelamento div {
    display: flex;
    gap: 1vw;
    justify-content: center;
}



.conteiner-esquerdo {
    display: flex;
    flex-direction: column;
    gap: 1vw;
    color: #B2B2B2;
    border-radius: 10px;
    background-color: #1f1f1f;
    padding: 0 1vw 1vw 1vw;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;

}

.titulo {
    font-size: 4vh;
    color: #e8e8e8;
    margin: 1vw;
}

.geral {
    text-align: center;
    padding: 1vh;
}

.sub-titulos {
    padding: 1vh;
    cursor: pointer;
    transition: 200ms;
}

.sub-titulos:hover {
    color: #f64348;
    transition: 200ms;
}

.conteiner-sub-titulos {
    width: 30vw;
    height: fit-content;
    background-color: #1f1f1f;
    color: #e8e8e8;
    font-size: 4vh;
    padding: 2vw;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;

}

.descricao {
    color: #B2B2B2;
    font-size: 2vh;
}

.plano {
    display: flex;
    justify-content: space-around;
    align-items: center;
    border: 2px solid #353535;
    margin: 3vh 0;
    width: 30vw;
    height: 5vh;
    font-size: 2.5vh;
}

.alterar-botao {
    cursor: pointer;
    padding: 1vh;
    border-radius: 10px;
    border: none;
    background-color: #f64348;
    color: #e8e8e8;
    font-weight: bold;
    transition: 300ms;
}

button {
    padding: 1.5vh 3vw;
    cursor: pointer;
    border-radius: 10px;
    border: none;
    background-color: #f64348;
    color: #e8e8e8;
    font-weight: bold;
    transition: 300ms;
    font-family: 'Karla', sans-serif;
    user-select: none;
    transition: 300ms ease-in-out;

}

button:hover {
    color: #1f1f1f;
    transition: 300ms ease-in-out;
}

.conteiner-botoes {
    display: flex;
    gap: 1vw;
}

.dropdown {
    position: relative;
    display: inline-block;
    font-size: 2.5vh;
    cursor: pointer;
    width: 20vw;
    color: #e8e8e8;
    font-size: 2vh;
    margin-bottom: 2vh;
    border-bottom: #B2B2B2 1px solid;
}

.conteudo-dropdown-audio,
.conteudo-dropdown-idioma,
.conteudo-dropdown-legenda {
    display: none;
    position: absolute;
    background-color: #353535;
    width: 100%;
    border-radius: 0 0 10px 10px;
    margin-top: 0.5vh;
    z-index: 1;
    color: #e8e8e8;

}

.idioma {
    display: flex;
    flex-direction: column;
    margin-top: 2vh;
    font-size: 3vh;
    color: #e8e8e8;
}

.escrita-dropdown {
    padding: 1vh 0;
}

.escrita-dropdown:hover {
    background-color: #f64348;
}

.titulo-idioma {
    font-size: 1.5vh;
    color: #e8e8e8;
    margin: 1vh 0;
}

.check-on {
    font-size: 7vh;
    color: #f64348;
    cursor: pointer;
}

.check-off {
    font-size: 7vh;
    color: #B2B2B2;
    cursor: pointer;
}

.conteudo {
    display: flex;
    align-items: center;
    gap: 1vw;
    font-size: 3vh;
}

.alterar-input {
    font-size: 2.5vh;
    color: #B2B2B2;
    display: flex;
    flex-direction: column;
    width: 25vw;
    justify-content: center;
    align-items: center;
    gap: 2vh;
    position: relative;
    margin: 2vh 0;

}

.conteiner-senha {
    display: flex;
    align-items: center;
}

.visibilidade {
    position: absolute;
    user-select: none;
    cursor: pointer;
    right: 3vw;
    display: flex;
    align-items: center;
    color: #959595;
}

.visibilidade:hover {
    color: #f64348;
}

input[type="email"],
input[type="password"],
input[type="text"] {
    background-color: #353535;
    border: none;
    padding: 1vh;
    border-radius: 10px;
    width: 20vw;
    margin: 0.5vh 0;
}

.conteiner-pagamentos {
    font-size: 2.5vh;
    color: #B2B2B2;
    margin-top: 2vw;
    display: flex;
    flex-direction: column;
    gap: 2vh;
}

.titulo-pagamentos {
    display: flex;
    gap: 1vh;
    color: #e8e8e8;
}

.escrita-pagamentos {
    color: #B2B2B2;
}

.credito {
    font-size: 3vh;
    margin: 2vw 0;
}

.cartao {
    display: flex;
    align-items: center;
    gap: 1vw;
    color: #B2B2B2;
    margin: 1vw 0;
}

.alterar {
    color: #e8e8e8;
    font-size: 2vh;
    margin-left: 2vw;
    cursor: pointer;
    transition: 300ms;
    font-family: 'Karla', sans-serif;
}

.alterar:hover {
    color: #f64348;
    transition: 300ms;
}

.conteiner-aviso {
    position: absolute;
    color: #e8e8e8;
    font-size: 3vh;
    width: 100%;
    height: 120vh;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}

.aviso {
    width: fit-content;
    height: auto;
    background-color: #1f1f1f;
    border-radius: 10px;
    padding: 1vw;
    display: flex;
    flex-direction: column;
    gap: 1vw;
    text-align: center;
}

.alerta {
    font-size: 2vh;
    color: #f64348;
}




@media screen and (max-width:1000px) {

    .tela {
        flex-direction: column;
        height: fit-content;
        padding-top:5vh;
    }
    .conteiner-esquerdo{
        width: 85vw;
    }
    .conteiner-sub-titulos{
        width: 85vw;
        font-size: 1.2em;
    }
    .descricao{
        font-size: 0.7em;
        margin-top: 1vh;
    }
    .plano{
        width: 80vw;
        font-size: 1em;
    }
    .idioma{
        width: 70vw;
        align-items: center;
    }
    .dropdown{
        width:50vw;
    }
    .conteudo{
        font-size: 0.8em;
    }
    .alterar-input{
        width: 80vw;
    }
    .alerta{
        font-size: 0.7em;
    }
    input[type='email'], input[type='password']{
        width: 73vw;
    }
    .conteiner-pagamentos{
        font-size: 0.8em;
    }
    .cancelamento{
        font-size: 1em;
    }
    
}
</style>