<template>
    <div class="tela">
        <div class="quadro">
            <div class="criar-conta">
                Criar conta
            </div>
            <div class="erro-input" v-if="preencheuInputs == false">
                Preencha todos os campos
            </div>
            <div class="conjunto-inputs">
                <input class="input" type="text" placeholder="Nome de Usuário" v-model="username" :style="inputNomeVazio()"
                    v-on:change="inputChange()" v-on:keyup.enter="confirmar()">
                <div>
                    <div class="erro-input2" v-if="nomeCurto == true">
                        Nome de usuário deve conter no mínimo 6 caracteres!
                    </div>
                    <div class="erro-input2" v-if="msgAlerta">
                        {{ msgAlerta }} 
                    </div>
                </div>
                <div class="tamanho-username">
                    Usuário deve conter no mínimo 6 caracteres e não conter espaços.
                </div>
                <input class="input" type="email" placeholder="email@exemplo.com.br" v-model="email"
                    v-on:keyup.enter="confirmar()" :style="inputEmailVazio()" v-on:change="inputChange()">
                <div class="conteiner-senha">
                    <input class="input" :type="visulalizarSenha(senhaVisivel)" placeholder="Senha" v-model="password"
                        v-on:keyup.enter="confirmar()" v-on:change="inputChange()" :style="inputSenhaVazio()">
                    <div class="visibilidade" v-on:click="mostrarSenha()">
                        <span class="material-icons" v-if="senhaVisivel == false">
                            visibility
                        </span>
                        <span class="material-icons" v-if="senhaVisivel == true">
                            visibility_off
                        </span>
                    </div>
                </div>
                <div class="tamanho-senha">
                    A senha deve conter no mínimo 8 caracteres.
                </div>
                <div class="conteiner-senha">
                    <input class="input" :type="visualizarConfirmarSenha(senhaNovamenteVisivel)"
                        v-on:keyup.enter="confirmar()" :style="inputSenhaNovamenteVazio()" placeholder="Confirme a senha"
                        v-model="senhaNovamente" v-on:change="inputChange()">
                    <div class="visibilidade" v-on:click="mostrarSenhaNovamente()">
                        <span class="material-icons" v-if="this.senhaNovamenteVisivel == false">
                            visibility
                        </span>
                        <span class="material-icons" v-if="this.senhaNovamenteVisivel == true">
                            visibility_off
                        </span>
                    </div>
                </div>
            </div>
            <div class="erro-input" v-if="this.senhaNaoCorrespondem == true">
                As senhas digitadas não correspondem
            </div>
            <div class="erro-input" v-if="senhaCurta == true">
                As senhas devem ter pelo menos 8 caracteres
            </div>
            <div class="conteiner-checkbox" v-on:click="acionarCheckbox()">
                <span class="material-icons " v-if="check == true" :style="checado()">
                    check_box
                </span>
                <span class="material-icons checkbox" v-if="check == false">
                    check_box_outline_blank
                </span>
                Sim! Quero receber ofertas especiais <br>
                e outras informações.
            </div>
            <div class="condicoes">
                Ao criar conta, você concorda com os
                <div class="termos" v-on:click="termosUso()">
                    Termos de Uso
                </div>
                e a
            </div>
            <div class="politica" v-on:click="politica()">
                Política de Privacidade.
            </div>
            <div class="condicoes-mobile">
                Ao criar conta, você concorda com os
                <div class="container-condicoes">
                    <div class="termos" v-on:click="termosUso()">
                        Termos de Uso
                    </div>
                    e a
                    <div class="politica-mobile" v-on:click="politica()">
                        Política de Privacidade.
                    </div>
                </div>
            </div>

            <BotoesAcao text="Criar conta" v-on:click="cadastrarUsuario()" />
            <div class="logar">
                <div class="separacao">
                </div>
                Já possui uma conta?
                <div class="separacao">
                </div>
            </div>
            <BotoesAcao text="Entrar" v-on:click="entrar()" />
        </div>
        <div class="card-loading" v-if="loading == true">
            <div class="card">
                <span class="material-icons loading">
                    refresh
                </span>
            </div>
        </div>
    </div>
</template>
<script>
import BotoesAcao from '@/components/BotoesAcao.vue'
export default {
    name: "pagina-cadastro",
    components: {
        BotoesAcao,
    },
    data() {
        return {
            senhaVisivel: false,
            senhaNovamenteVisivel: false,
            listaUsuarios: [],
            username: '',
            email: '',
            password: '',
            senhaNovamente: '',
            alertaSenhaErrada: false,
            senhaNaoCorrespondem: false,
            preencheuInputs: true,
            inputNome: false,
            inputSenha: false,
            inputEmail: false,
            inputSenhaNovamente: false,
            senhaCurta: false,
            check: false,
            loading: false,
            nomeCurto: false,
            msgAlerta: ''
        }
    },
    methods: {
        termosUso() {
            this.$router.push('/termos-de-uso')
        },
        politica() {
            this.$router.push('/politica-de-privacidade')
        },
        entrar() {
            this.$router.push('/login')
        },
        mostrarSenha() {
            if (this.senhaVisivel == false) {
                this.senhaVisivel = true
            } else {
                this.senhaVisivel = false
            }
        },
        mostrarSenhaNovamente() {
            if (this.senhaNovamenteVisivel == false) {
                this.senhaNovamenteVisivel = true
            } else {
                this.senhaNovamenteVisivel = false
            }
        },
        visulalizarSenha(senhaVisiel) {
            if (senhaVisiel == true) {
                return "text"
            } else {
                return "password"
            }
        },
        visualizarConfirmarSenha(senhaNovamenteVisivel) {
            if (senhaNovamenteVisivel == true) {
                return "text"
            } else {
                return "password"
            }
        },
        confirmar() {
            this.cadastrarUsuario()
        },
        cadastrarUsuario() {
            this.loading = true
            if (this.username && this.email && this.password && this.senhaNovamente) {
                if (this.username.length > 6) {
                    if (this.password.length >= 8) {
                        if (this.password == this.senhaNovamente) {
                            let user = {
                                username: this.username,
                                email: this.email,
                                password: this.password,
                                informacoes: this.check
                            }
                            localStorage.setItem('user', JSON.stringify(user))
                            const axios = require('axios')
                            let endereço = "https://easy-password.up.railway.app/account/"
                            let body = { user: user }
                            axios.post(endereço, body).then(response => {
                                this.loading = false
                                if (response) {
                                    this.logar()
                                }
                            }).catch(error => {
                                this.loading = false
                                if (error.response.data.user.username[0]) {
                                    this.inputNome = true
                                    this.msgAlerta = error.response.data.user.username[0]
                                }
                                if (error.response.data.user.email) {
                                    this.inputEmail = true
                                }
                                if (error.response.data.user.password) {
                                    this.inputSenha = true
                                }
                            })
                        } else {
                            this.alertaSenhaErrada = true
                            this.loading = false
                        }
                    } else {
                        this.senhaCurta = true
                        this.loading = false
                    }
                } else {
                    this.nomeCurto = true
                    this.loading = false
                }

            } else {
                this.loading = false
                this.preencheuInputs = false
                if (!this.username) {
                    this.inputNome = true
                    this.preencheuInputs = false
                }
                if (!this.password) {
                    this.inputSenha = true
                    this.preencheuInputs = false
                }
                if (!this.email) {
                    this.inputEmail = true
                    this.preencheuInputs = false
                }
                if (!this.senhaNovamente) {
                    this.inputSenhaNovamente = true
                    this.preencheuInputs = false
                }
            }
        },
        logar() {
            const axios = require('axios')
            let endereço = "https://easy-password.up.railway.app/o/token/"
            let body = new URLSearchParams()
            body.append("grant_type", "password")
            body.append("client_id", "eK9Uqd4aPtfFkhoCkVfG1vN4sVlwXp0fz0pJYaCy")
            body.append("client_secret", "DGMDMf6ZsT7hdGxxs1Xk8PZrBNcoiYnZjuOsG0pqtgSY1lWuW24ckFuFfv281bGAYicCgjNh3znpS8t9iJ1spcPDk32xwPJ1wGiabsSwF29e3wwJWYyVQmrNAd1vj0of")
            body.append("username", this.username)
            body.append("password", this.password)
            let config = { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
            axios.post(endereço, body, config).then(response => {
                let token = response.data.access_token
                localStorage.setItem("token", token)
                let usuarioLogado = {
                    nomeUsuario: this.username
                }
                localStorage.setItem('usuarioLogado', JSON.stringify(usuarioLogado))
                this.loading = false
                this.$router.push('/home')
                setTimeout(() => {
                    window.location.reload();
                }, 100);
            }).catch(error => {
                this.loading = false
                if (error) {
                    this.$router.push('/login')
                }
            })
        },
        inputEmailVazio() {
            if (this.inputEmail == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        inputNomeVazio() {
            if (this.inputNome == true || this.nomeCurto == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        inputSenhaVazio() {
            if (this.inputSenha == true) {
                return "outline: 1px solid #f64348;"
            }
            if (this.senhaCurta == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        inputSenhaNovamenteVazio() {
            if (this.alertaSenhaErrada == true) {
                this.senhaNaoCorrespondem = true
                return "outline: 1px solid #f64348;"
            }
            if (this.inputSenhaNovamente == true) {
                return "outline: 1px solid #f64348;"
            }
            if (this.senhaCurta == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        inputChange() {
            if (this.username) {
                this.inputNome = false
                this.nomeCurto = false
            }
            if (this.password) {
                this.inputSenha = false
                this.senhaNaoCorrespondem = false
            }
            if (this.password.length >= 8) {
                this.senhaCurta = false
            }
            if (this.email) {
                this.inputEmail = false
            }
            if (this.senhaNovamente) {
                this.inputSenhaNovamente = false
            }
            if (this.username && this.email && this.password && this.senhaNovamente) {
                this.preencheuInputs = true
            }
        },
        acionarCheckbox() {
            if (this.check == false) {
                this.check = true
            } else {
                this.check = false
            }
        },
        checado() {
            if (this.check == true) {
                return "color: #f64348;"
            }
        }
    },
    created() {
        let listaUsers = localStorage.getItem("Usuario")
        listaUsers = JSON.parse(listaUsers)
        if (listaUsers) {
            this.listaUsuarios = listaUsers
        }
    }
}
</script>
<style scoped>
.tela {
    background-color: #1f1f1f;
    justify-content: center;
    width: 100%;
    padding: 5vw 0;
    display: flex;
    align-items: center;
    position: relative;
    box-sizing: border-box;
}

.card-loading {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.5);
    left: 0;
    top: -10vh;
    width: 100%;
    height: 128%;
}

.card {
    background-color: black;
    color: white;
    font-size: 3.5vh;
    border-radius: 10px;
    padding: 1vw;
    text-align: center;
    display: flex;
    align-items: center;
}

.loading {
    font-size: 5vh;
    -webkit-animation: spin 4s linear infinite;
    -moz-animation: spin 4s linear infinite;
    animation: spin 4s linear infinite;
}

@keyframes spin {
    100% {
        transform: rotate(360deg);
    }
}

.quadro {
    width: fit-content;
    background-color: #1f1f1f;
    border-radius: 10px;
    color: #e8e8e8;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
    padding: 2vh;
    font-size: large;
}

.criar-conta {
    font-size: 5vh;
    text-align: center;
    margin-bottom: 3vh;
}

.conjunto-inputs {
    display: flex;
    flex-direction: column;
    gap: 2vh;
    align-items: center;
}

.input {
    background-color: #343434;
    border: none;
    height: 4vh;
    width: 25vw;
    padding-left: 1vh;
    border-radius: 2vh;
    color: #e8e8e8;
    font-size: medium;
    box-shadow: inset 0px 0px 1vh 0.5vh #00000020;
    font-family: 'Karla', sans-serif;
}

::placeholder {
    color: #959595;
    font-family: 'Karla', sans-serif;

}

input[type=checkbox] {
    accent-color: #f64348;
    cursor: pointer;
}

input:hover {
    background-color: #646464;
    transition: 200ms ease-in-out;
}

.conteiner-senha {
    position: relative;
    display: flex;
    align-items: center;
    color: #959595;
}

.visibilidade {
    position: absolute;
    right: 1vw;
    user-select: none;
    cursor: pointer;
}

.visibilidade:hover {
    color: #f64348;
}

.erro-input,
.erro-input2 {
    color: #f64348;
    font-size: 2vh;
}

.erro-input {
    margin: 0.5vh 0 1vh 3vw;
}

.conteiner-checkbox {
    display: flex;
    align-items: flex-start;
    font-size: 2.5vh;
    gap: 1vh;
    padding: 3vh 0 3vh 2vw;
    box-sizing: border-box;
    cursor: pointer;
    user-select: none;
}

.checkbox {
    color: #646464;
}

.condicoes {
    display: flex;
    gap: 1vh;
    font-size: 2vh;
    margin-left: 1.5vw;
}

.condicoes-mobile {
    display: none;
}

.politica {
    font-size: 2vh;
    width: fit-content;
    margin:0 0 2vw 1.5vw;
}

.termos:hover,
.politica:hover {
    color: #f64348;
    cursor: pointer;
}

.logar {
    display: flex;
    align-items: center;
    gap: 1vh;
    margin-bottom: 3vh;
    justify-content: center;
    font-size: 2vh;
}

.separacao {
    border-bottom: 1px solid #e8e8e8;
    width: 5vw;
}

.tamanho-senha {
    font-size: 2vh;    
}
.tamanho-username{
    font-size: 2vh;
    padding:0 2vw;
    width: 28vw;
    box-sizing: border-box;
}


@media screen and (max-width:1000px) {
    .tela {
        padding: 5vh 0;
        box-sizing: border-box;
    }

    .quadro {
        padding: 2vh;
        width: 84vw;
    }

    .criar-conta {
        font-size: 1.6em;
    }

    .conjunto-inputs {
        gap: 2vh;
    }

    .input {
        width: 95%;
        height: 3vh;
    }

    .conteiner-senha {
        width: 100%;
    }
    ::placeholder{
        font-size: 0.9em;
    }

    .visibilidade {
        right: 5vw;
        padding-top: 4px;
    }

    .conteiner-checkbox {
        font-size: 0.7em;
        padding: 1vh 0 3vh 3vw;
    }

    .condicoes,
    .politica {
        display: none;
    }

    .condicoes-mobile {
        font-size: 0.7em;
        margin: 0 0 3vh 4vw;
    }
    .container-condicoes{
        display: flex;
        gap:1vw;
    }
    .politica-mobile, .termos{
        text-decoration: underline;
    }
    .tamanho-senha{
        font-size: 0.8em;
    }
    .tamanho-username{
        font-size: 0.8em;
        width: unset;
    }
}</style>