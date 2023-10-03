<template>
    <div class="tela">
        <div class="conteiner-cards">
            <div class="minha-lista">
                Meus Downloads
            </div>
            <div v-if="listaFilmes == 0 && listaSeries == 0 && listaAnimes == 0" class="aviso-lista-vazia">
                <div>
                    A sua lista esta vazia
                </div>
                <div>
                    Baixe séries, animes e filmes favoritos que deseja assistir clicando em Adicionar à Lista e assista
                    quando e onde quiser.
                </div>
            </div>
            <div v-if="listaFilmes != 0">
                <div class="titulo">
                    Meus Filmes
                </div>
                <div class="separacao">
                </div>
                <div class="fileira-cards">
                    <div v-for="filme in listaFilmes" :key="filme.nome">
                        <MiniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota"
                            :categoria1="filme.categoria1" :categoria2="filme.categoria2" :categoria3="filme.categoria3"
                            :resumoSinopse="filme.resumoSinopse" :duracaoFilme="filme.duracaoFilme" :download="true"
                            :faixaEtaria="filme.faixaEtaria" :sinopseCompleta="filme.sinopseCompleta"
                            :atualizarPagina="atualizarPagina" :wallpaper="filme.wallpaper"
                            :tipoDoTitulo="filme.tipoDoTitulo" :sinopse="true" v-if="filme.tipoDoTitulo == 'filme'" />
                    </div>
                </div>
            </div>

            <div v-if="listaSeries != 0">
                <div class="titulo">
                    Minhas Séries
                </div>
                <div class="separacao">
                </div>
                <div class="fileira-cards">
                    <div v-for="serie in listaSeries" :key="serie.nome">
                        <MiniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota"
                            :categoria1="serie.categoria1" :categoria2="serie.categoria2" :categoria3="serie.categoria3"
                            :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                            :faixaEtaria="serie.faixaEtaria" :download="true" :tipoDoTitulo="serie.tipoDoTitulo"
                            :sinopseCompleta="serie.sinopseCompleta" :atualizarPagina="atualizarPagina"
                            :wallpaper="serie.wallpaper" :sinopse="true" v-if="serie.tipoDoTitulo == 'serie'" />
                    </div>
                </div>
            </div>

            <div v-if="listaAnimes != 0">
                <div class="titulo">
                    Meus Animes
                </div>
                <div class="separacao">
                </div>
                <div class="fileira-cards">
                    <div v-for="anime in listaAnimes" :key="anime.nome">
                        <MiniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota"
                            :categoria1="anime.categoria1" :categoria2="anime.categoria2" :categoria3="anime.categoria3"
                            :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                            :faixaEtaria="anime.faixaEtaria" :atualizarPagina="atualizarPagina"
                            :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true"
                            :download="true" :adicionadoNaLista="anime.adicionadoNaLista" :tipoDoTitulo="anime.tipoDoTitulo"
                            v-if="anime.tipoDoTitulo == 'anime'" />
                    </div>
                </div>
            </div>

        </div>
        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import MiniCards from '@/components/MiniCards.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: 'paginaMeusDownloads',
    components: {
        MiniCards,
        alerta
    },
    data() {
        return {
            listaAnimes: [],
            listaFilmes: [],
            listaSeries: [],
            aviso: false
        }
    },
    methods: {
        atualizarPagina() {
            this.listaAnimes = []
            this.listaFilmes = []
            this.listaSeries = []
            this.carregarLista()
        },
        findInTheList(value) {
            if (value.tipoDoTitulo == 'filme') {
                return value
            }
        },
        carregarLista() {
            let usuario = localStorage.getItem('usuarioLogado')
            usuario = JSON.parse(usuario)
            if (usuario.meusDownloads) {
                usuario.meusDownloads.forEach(this.element)
            }
        },
        element(value) {
            if (value.tipoDoTitulo == 'filme') {
                this.listaFilmes.push(value)
            } else if (value.tipoDoTitulo == 'serie') {
                this.listaSeries.push(value)
            } else if (value.tipoDoTitulo == 'anime') {
                this.listaAnimes.push(value)
            }
        },
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
        this.carregarLista()
    }
}
</script>
<style scoped>
.conteiner-cards {
    margin: 5vw 5vw;
    color: #e8e8e8;
    font-size: 3vh;
}

.minha-lista {
    font-size: 4vh;
    font-weight: bold;
    margin: 0 0 2vw 4vw;
}

.aviso-lista-vazia {
    font-size: 2.5vh;
    display: flex;
    flex-direction: column;
    gap: 1vh;
    margin-left: 4vw;

}

.fileira-cards {
    display: flex;
    gap: 2vw;
    margin: 2vw 0;
    flex-wrap: wrap;
}

.titulo {
    margin-left: 3vw;
}

.separacao {
    width: 97%;
    height: 1px;
    background-image: linear-gradient(to right, #898989, #1f1f1f);
    margin: 0 0 2vw 2vw;
}



@media screen and (max-width:1000px) {
    .minha-lista{
        font-size: 1.2em;
    }
    .fileira-cards{
        flex-wrap: nowrap;
        overflow: scroll;
        gap: 4vw;

    }
    .fileira-cards::-webkit-scrollbar{
        height: 0;
    }
    .titulo{
        font-size: 0.9em;
        margin-top: 2vh;
    }
    .aviso-lista-vazia{
        font-size: 0.8em;
    }
}
</style>