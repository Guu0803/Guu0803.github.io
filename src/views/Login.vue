<template>
    <div class="tela">
        <div class="login">
            <div class="entrar">
                Entrar
            </div>
            <div class="aviso-de-erro2" v-if="inputUsernameVazio == true || inputPasswordVazio == true">
                Preencha todos os campos
            </div>
            <div class="aviso-de-erro2" v-if="avisoErro == true">
                Nome de Usário ou senha inválidos. <br>
                Por favor, verifique e tente novamente.
            </div>
            <div class="conjunto-inputs">
                <input type="texto" placeholder="Nome de usuário" v-model="username" :style="erroNomeUsario()"
                    v-on:keyup.enter="entrar()" v-on:change="inputChange()">
                <div class="aviso-de-erro" v-if="inputUsernameVazio == true">
                    Nome de Usário inválido. Por favor, verifique e tente novamente.
                </div>
                <div class="conteiner-senha">
                    <input :type="showPassword(senhaVisivel)" placeholder="Senha" v-model="password" :style="erroSenha()"
                        v-on:change="inputChange()" v-on:keyup.enter="entrar()">
                    <div class="visibilidade" v-on:click="mostrarSenha()">
                        <span class="material-icons" v-if="senhaVisivel == false">
                            visibility
                        </span>
                        <span class="material-icons" v-if="senhaVisivel == true">
                            visibility_off
                        </span>
                    </div>
                </div>
                <div class="aviso-de-erro" v-if="inputPasswordVazio == true">
                    Senha inválida. Por favor, verifique e tente novamente.
                </div>
            </div>
            <div class="conteiner-esqueci-senha">
                <div class="conteiner-checkbox" v-on:click="acionarCheckbox()">
                    <span class="material-icons " v-if="check == true" :style="checado()">
                        check_box
                    </span>
                    <span class="material-icons checkbox" v-if="check == false">
                        check_box_outline_blank
                    </span>
                    Manter-se conectado
                </div>
                <div class="esqueci-senha">
                    Esqueci a senha
                </div>
            </div>
            <BotaoAcao text="Entrar" v-on:click="validar()" />
            <div class="nao-possui-conta">
                <div class="separacao">
                </div>
                Não possui uma conta?
                <div class="separacao">
                </div>
            </div>
            <BotaoAcao text="Criar Conta" v-on:click="criarConta()" />
        </div>
        <div class="conteiner-aviso" v-if="validado == true">
            <div class="aviso">
                Logado com sucesso
                <BotaoAcao text="fechar" v-on:click="fecharAviso()" />
            </div>
        </div>
        <div class="card-loading" v-if="loading == true">
            <div class="card">
                <span class="material-icons loading">
                    refresh
                </span>
            </div>
        </div>
        <div class="conteiner-aviso" v-if="aviso == true">
            <div class="aviso">
                Você já esta logado!
                <BotaoAcao text="fechar" v-on:click="fecharAviso()" />
            </div>
        </div>
    </div>
</template>
<script>
import BotaoAcao from '@/components/BotoesAcao.vue'
export default {
    name: "pagina-login",
    components: {
        BotaoAcao,
    },
    data() {
        return {
            senhaVisivel: false,
            username: '',
            password: '',
            listaUsuarios: [],
            validado: false,
            check: false,
            inputUsernameVazio: false,
            inputPasswordVazio: false,
            loading: false,
            avisoErro: false,
            aviso: false
        }
    },
    methods: {
        criarConta() {
            this.$router.push('/cadastro')
        },
        mostrarSenha() {
            if (this.senhaVisivel == false) {
                this.senhaVisivel = true
            } else {
                this.senhaVisivel = false
            }
        },
        validar() {
            this.loading = true
            if (this.username && this.password) {
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
                    this.validado = true
                    this.inputUsernameVazio = false
                    this.inputPasswordVazio = false
                    this.loading = false
                }).catch(error => {
                    this.loading = false
                    console.log(error)
                    this.avisoErro = true
                })
            } else {
                this.inputUsernameVazio = true
                this.inputPasswordVazio = true
                this.loading = false
            }
        },
        fecharAviso() {
            this.validado = false
            this.aviso = false
            this.$router.push('/home')
            setTimeout(() => {
                window.location.reload();
            }, 100);
        },
        erroNomeUsario() {
            if ((this.inputUsernameVazio == true && !this.username) || this.avisoErro == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        erroSenha() {
            if ((this.inputPasswordVazio == true && !this.password) || this.avisoErro == true) {
                return "outline: 1px solid #f64348;"
            }
        },
        showPassword(senhaVisivel) {
            if (senhaVisivel == true) {
                return "text"
            } else {
                return "password"
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
        },
        inputChange() {
            if (this.username) {
                this.inputUsernameVazio = false
                this.avisoErro = false
            }
            if (this.password) {
                this.inputPasswordVazio = false
                this.avisoErro = false
            }
        },
        entrar() {
            this.validar()
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
                if (response) {
                    this.aviso = true
                }
            }).catch(error => {
                if (error) {
                    this.$router.push('/login')
                    localStorage.removeItem('usuarioLogado')
                    localStorage.removeItem('token')
                }
            })
            let listaUsers = localStorage.getItem("Usuario")
            listaUsers = JSON.parse(listaUsers)
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
}

.card-loading {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.5);
    left: 0;
    top: 0;
    width: 100%;
    height: 125.5%;
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

.login {
    width: 30vw;
    background-color: #1f1f1f;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    color: #e8e8e8;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
    padding: 3vh;
}

.entrar {
    font-size: 5vh;
    text-align: center;
    margin-bottom: 2vw;
}

.nao-possui-conta {
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


.conjunto-inputs {
    display: flex;
    flex-direction: column;
    gap: 3vh;
    align-items: center;
    justify-content: center;
}

.conteiner-senha {
    display: flex;
    align-items: center;
    color: #959595;
    position: relative;
}

.visibilidade {
    position: absolute;
    right: 1vw;
    cursor: pointer;
    padding-top: 3px;
}

.visibilidade:hover {
    color: #f64348;
}

input {
    background-color: #343434;
    border: none;
    height: 4vh;
    width: 25vw;
    padding-left: 1vh;
    border-radius: 2vh;
    color: #e8e8e8;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: medium;
    box-shadow: inset 0px 0px 1vh 0.5vh #00000020;
    transition: 200ms ease-in-out;
}

::placeholder {
    color: #959595;
    font-family: 'Karla', sans-serif;

}

input:hover {
    background-color: #646464;
    transition: 200ms ease-in-out;
}

.conteiner-esqueci-senha {
    font-size: 2vh;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 1vh;
    margin-bottom: 5vh;
    width: 25vw;

}

.conteiner-checkbox {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin-top: 1vh;
    padding-left: 2vw;
    gap: 1vh;
    box-sizing: border-box;

}

.checkbox {
    color: #646464;

}

.esqueci-senha:hover {
    color: #f64348;
    cursor: pointer;
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

.aviso-de-erro, .aviso-de-erro2 {
    color: #f64348;
    font-size: 2vh;
    margin: -2vh 0 1vh 2vh;
    
}

@media screen and (max-width:1000px) {
    .entrar {
        font-size: 1.5em;
        margin-bottom: 3vh;
    }
    .card-loading{
        height: 140%;
    }
    .login {
        width: 80vw;
    }

    .conjunto-inputs {
        gap: 2vh;
    }

    input {
        width: 95%;
        height: 3vh;
    }

    .conteiner-senha {
        width: 100%;
    }

    .visibilidade {
        right: 3vw;
        padding-top: 4px;
    }

    .conteiner-esqueci-senha {
        margin-bottom: 3vh;
        font-size: 0.8em;
        gap: 4vw;
        width:70vw;
    }

    .checkbox {
        font-size: 1.5em;
    }

    .esqueci-senha {
        margin-top: 1.3vh;
    }

    .aviso-de-erro {
        font-size: .7em;
        margin: 0;
        width: 70vw;
    }

    .aviso-de-erro2 {
        color: #f64348;
        font-size: 0.7em;
        margin: -2vh 0 1vh 3vh;
    }

    .aviso {
        font-size: 0.8em;
        padding: 1vh;
        gap: 2vh;
    }

}</style>