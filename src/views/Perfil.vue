<template>
    <div class="tela">
        <div class="titulo">
            Perfil
        </div>
        <div class="conteiner-perfil">
            <div class="perfil" v-for="perfil in usuarioLogado.listaPerfis" :key="perfil.id">
                <span class="material-icons icone-perfil">
                    person
                </span>
                <div class="conteiner-nome">
                    {{ perfil.nome }}
                    <span class="material-icons icones" v-on:click="editarNome(perfil)" v-if="confirmarPerfil == true">
                        edit
                    </span>
                </div>
                <div class="conteiner-input-nome">
                    <input type="name" placeholder="Nome" v-model="novoNomePerfil" class="input-novo-nome"
                        v-if="perfil.input == true" v-on:keypress.enter="mudarNome(perfil)">
                    <div class="confirmar-nome" v-if="perfil.input == true" v-on:click="fecharInputNovoNome(perfil)">
                        Ok
                    </div>
                </div>
                <div class="conteiner-editar" :class="editarAparece()">
                    <span class="material-icons icones" v-on:click="deletar(perfil)">
                        delete
                    </span>
                </div>
            </div>
            <div class="perfil" v-on:click="addUsuario()">
                <span class="material-icons icone-perfil">
                    person_add
                </span>
                <div class="conteiner-nome">
                    Novo perfil
                </div>
                <div class="conteiner-input-nome">
                </div>
            </div>
        </div>
        <div class="novo-perfil-conteiner" v-if="adicionarUsuario == true">
            <div class="titulo-perfil-conteiner">
                Adicionar novo perfil
            </div>
            <div class="erro-input-nome" v-if="preencheuNome == false">
                Por favor, preencha todos os campos.
            </div>
            <input type="name" placeholder="Nome" v-model="nomePerfil" class="input-nome" v-on:focus="fecharErro()"
                :style="erroDePreenchimentoNome()">
            <div class="conjunto-botoes">
                <button v-on:click="confimarNovoPerfil()">
                    Confirmar
                </button>
                <button v-on:click="cancelarNovoUsuario()">
                    Cancelar
                </button>
            </div>
        </div>
        <div class="msg-alerta" v-if="mensagemAlerta == true">
            Numero máximo de usuários foi atingido
            <button v-on:click="fecharMsg()">
                Fechar
            </button>
        </div>
        <button v-on:click="editarBtn()" v-if="editarPerfil == true">
            Editar Perfil
        </button>
        <button v-on:click="confirmarBtn()" v-if="confirmarPerfil == true">
            Confirmar
        </button>
        <alerta v-if="aviso == true" />
    </div>
</template>
<script>
import alerta from '@/components/msgAlerta.vue'
export default {
    name: "perfilPag",
    components: {
        alerta
    },
    data() {
        return {
            editarPerfil: true,
            confirmarPerfil: false,
            nomePerfil: "",
            usuarioLogado: {},
            perfilClicado: '',
            mensagemAlerta: false,
            adicionarUsuario: false,
            confirmou: false,
            preencheuNome: true,
            novoNomePerfil: '',
            aviso: false
        }
    },
    methods: {
        addUsuario() {
            if (this.usuarioLogado.listaPerfis.length <= 4) {
                this.adicionarUsuario = true
            } else {
                this.mensagemAlerta = true
            }
        },
        cancelarNovoUsuario() {
            this.adicionarUsuario = false
        },
        confimarNovoPerfil() {
            if (this.nomePerfil) {
                this.adicionarUsuario = false
                this.confirmar = true
                let perfil = {
                    nome: this.nomePerfil,
                    id: this.usuarioLogado.listaPerfis[this.usuarioLogado.listaPerfis.length - 1].id + 1,
                    input: false
                }
                this.usuarioLogado.listaPerfis.push(perfil)
                localStorage.setItem('usuarioLogado', JSON.stringify(this.usuarioLogado))
                this.adicionarUsuario = false
                this.nomePerfil = ''
            } else {
                this.preencheuNome = false
            }
        },
        editarBtn() {
            this.confirmarPerfil = true
            this.editarPerfil = false
        },
        editarAparece() {
            if (this.confirmarPerfil == true)
                return "editar"
        },
        confirmarBtn() {
            this.confirmarPerfil = false
            this.editarPerfil = true
        },
        fecharMsg() {
            this.mensagemAlerta = false
        },
        deletar(perfil) {
            this.perfilClicado = perfil
            this.usuarioLogado.listaPerfis = this.usuarioLogado.listaPerfis.filter(this.removerPerfil)
            localStorage.setItem('usuarioLogado', JSON.stringify(this.usuarioLogado))
        },
        removerPerfil(value) {
            if (this.perfilClicado.nome != value.nome) {
                return value
            }
        },
        editarNome(perfil) {
            this.perfilClicado = perfil
            if (this.perfilClicado.nome == perfil.nome) {
                perfil.input = true
            }
        },
        mudarNome(perfil) {
            if (this.novoNomePerfil) {
                perfil.nome = this.novoNomePerfil
                perfil.input = false
                localStorage.setItem('usuarioLogado', JSON.stringify(this.usuarioLogado))
                this.novoNomePerfil = ''
            }
        },
        fecharInputNovoNome(perfil) {
            perfil.input = false
            this.mudarNome(perfil)
        },
        erroDePreenchimentoNome() {
            if (this.preencheuNome == false) {
                return 'border: 1px solid red'
            }
        },
        fecharErro() {
            this.preencheuNome = true
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
        let usuario = localStorage.getItem("usuarioLogado")
        usuario = JSON.parse(usuario)
        if (usuario) {
            if (!usuario.listaPerfis) {
                let perfis = [
                    {
                        nome: usuario.nomeUsuario,
                        img: '',
                        id: 1,
                        input: false
                    }
                ]
                usuario.listaPerfis = perfis
                this.usuarioLogado = usuario
            } else {
                this.usuarioLogado = usuario
            }
        }
    }
}
</script>
<style scoped>
.tela {
    height: 70vh;
    width: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    gap: 2vw;
    position: relative;
    padding-top: 10vh;
}
.titulo{
    font-size: 6vh;
    color: #e8e8e8;
    margin-bottom: 3vh;
    font-weight: bold;
}
.conteiner-editar {
    display: none;
    gap: 1vw;
}

.editar {
    position: absolute;
    top: 0;
    font-size: 5vh;
    height: 19vh;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background-color: rgba(0, 0, 0, 0.5);
}

.icones {
    cursor: pointer;
    color: #e8e8e8;
}

.icones:hover {
    color: #f64348;
}

.conteiner-perfil {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 25vh;
    gap: 4vw;

}

.conteiner-nome {
    display: flex;
    align-items: center;
    gap: 1vh;
}

.conteiner-input-nome {
    height: 5vh;
    display: flex;
    width: 10vw;
    align-items: center;
}

.input-novo-nome {
    padding: 1.5vh;
    border: none;
    border-radius: 10px;
    width: 10vw;
}

.perfil {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #e8e8e8;
    gap: 1vw;
    font-size: 3vh;
    position: relative;
}

.novo-perfil-conteiner {
    position: absolute;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #111111;
    border-radius: 10px;
    color: #B2B2B2;
    padding: 2vw;
    gap: 1vw;
}

.input-nome {
    padding: 1vh;
    border: none;
    border-radius: 10px;
}

.erro-input-nome {
    color: #f64348;
    font-size: 2vh;
}

.conjunto-botoes {
    display: flex;
    gap: 1vw;
}

.titulo-perfil-conteiner {
    font-size: 3vh;
    color: #e8e8e8;
}

.icone-perfil {
    font-size: 15vh;
    color: #B2B2B2;
    border: 3px solid #B2B2B2;
    padding: 1vw;
    border-radius: 50%;
    cursor: pointer;
    background-color: #353535;
    transition: 300ms;
    cursor: pointer;
    transition: 300ms ease-in-out;
}

.icone-perfil:hover {
    color: #f64348;
    border-color: #f64348;
    transition: 300ms ease-in-out;
}

button {
    font-size: 2.5vh;
    padding: 1.5vh;
    cursor: pointer;
    border-radius: 10px;
    border: none;
    background-color: #353535;
    color: #B2B2B2;
    font-weight: bold;
    transition: 300ms;
    margin-top: 2vw;
    font-family: 'Karla', sans-serif;
    user-select: none;
}

button:hover,
.confirmar-nome:hover {
    background-color: #f64348;
    transition: 300ms;
    color: white;
}

.msg-alerta {
    color: #B2B2B2;
    font-size: 3vh;
}

.confirmar-nome {
    font-size: 2vh;
    padding: 1vh;
    cursor: pointer;
    border-radius: 10px;
    border: none;
    background-color: #1f1f1f;
    color: #B2B2B2;
    font-weight: bold;
    transition: 300ms;
    font-family: 'Karla', sans-serif;
    user-select: none;
    margin-left: -2.5vw;
}

@media screen and (max-width: 1000px) {
    .tela {
        height: fit-content;
        
    }
    .titulo{
        font-size: 1.7em;
        color: #e8e8e8;
        font-weight: bold;
    }
    .conteiner-editar {
        position: absolute;
        top: 0;
        height: 8vh;
        width: 14vw;
        border-radius: 50%;
    }

    .conteiner-perfil {
        width: 80%;
        flex-wrap: wrap;
        gap: 1vw;
        height: fit-content;
    }

    .perfil {
        width: 25vw;
        height: 15vh;
        margin-bottom: 2vh;
    }

    .conteiner-nome {
        font-size: 0.7em;
        margin-top: 4.5vh;
    }
     
    .conteiner-input-nome{
        width: 95%;
        height: 2vh;
        position: absolute;
        bottom: 0;
    }
    .novo-perfil{
        font-size: 0.8em;
        margin-top: 3vh;
    }
    .input-novo-nome{
        height: 1vh;
        width: 21vw;
        padding: 1vh;
        border-radius: 5px;
    }
    ::placeholder{
        font-size: 0.8em;
    }
    .confirmar-nome{
        font-size: 0.5em;
        margin-left: -7vw;
        background-color: unset;
        height: fit-content;
    }
    .icone-perfil {
        font-size: 6vh;
        position: absolute;
        top: 0;
    }

    .icones {
        font-size: 2vh;
    }

    button{
        font-size: 0.8em;
    }
}</style>