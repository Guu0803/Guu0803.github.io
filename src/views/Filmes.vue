<template>
    <div class="tela">
        <div v-for="filme in destaque1" :key="filme.id">
            <cardLancamentos :nome="filme.nome" :imagem="filme.imagem" :imagemBanner="filme.imagemBanner" :nota="filme.nota"
                :categoria1="filme.categoria1" :categoria2="filme.categoria2" :thumbnail="filme.thumbnail"
                :imagemBannerFundo="filme.imagemBannerFundo" :categoria3="filme.categoria3"
                :resumoSinopse="filme.resumoSinopse" :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria"
                :tipoDoTitulo="filme.tipoDoTitulo" :trailer="filme.trailer" :direcao="filme.direcao" :elenco="filme.elenco"
                :roteiro="filme.roteiro" :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper"
                :sinopse="true" />
        </div>
        <div class="conteiner-geral">
            <div class="titulo-fileira-cards">
                Terror
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="filme in listaTerror" :key="filme.id" class="fileira-cards">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :trailer="filme.trailer"
                        :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :tipoDoTitulo="filme.tipoDoTitulo"
                        :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Ação
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="filme in listaAcao" :key="filme.id" class="fileira-cards">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :trailer="filme.trailer"
                        :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :tipoDoTitulo="filme.tipoDoTitulo"
                        :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Drama
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="filme in listaDrama" :key="filme.id" class="fileira-cards">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :trailer="filme.trailer"
                        :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :tipoDoTitulo="filme.tipoDoTitulo"
                        :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Recomendação
            </div>
            <div class="separacao">
            </div>
            <div v-for="filme in destaque2" :key="filme.id">
                <cardLancamentos :nome="filme.nome" :imagem="filme.imagem" :imagemBanner="filme.imagemBanner"
                    :nota="filme.nota" :categoria1="filme.categoria1" :categoria2="filme.categoria2"
                    :thumbnail="filme.thumbnail" :imagemBannerFundo="filme.imagemBannerFundo" :categoria3="filme.categoria3"
                    :resumoSinopse="filme.resumoSinopse" :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria"
                    :tipoDoTitulo="filme.tipoDoTitulo" :trailer="filme.trailer" :direcao="filme.direcao"
                    :elenco="filme.elenco" :roteiro="filme.roteiro" :sinopseCompleta="filme.sinopseCompleta"
                    :wallpaper="filme.wallpaper" :sinopse="true" />
            </div>
            <div class="titulo-fileira-cards">
                Infantil
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="filme in listaAventura" :key="filme.id" class="fileira-cards">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :trailer="filme.trailer"
                        :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :tipoDoTitulo="filme.tipoDoTitulo"
                        :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Romance
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="filme in listaRomance" :key="filme.id" class="fileira-cards">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :trailer="filme.trailer"
                        :sinopseCompleta="filme.sinopseCompleta" :wallpaper="filme.wallpaper" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :tipoDoTitulo="filme.tipoDoTitulo"
                        :sinopse="true" />
                </div>
            </div>
            <!-- Cada component minicard esta recebendo uma prop, "nome", ":sinopse (se for verdadeiro, ao passar o mouse em cima exibira a sinopse)", 
                "conteudoSinopse (a sinopse em si)", "classificação" e a "categoria" -->
            <!-- A prop "bannerWallpaper", "sinopseCompleta", "faixaEtaria" e "duracaoFilme" estão recebendo variaveis que estao sendo salvas no localStorage  e sendo exibidas na pagina "Detalhes do titulo" -->

        </div>

        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import miniCards from '@/components/MiniCards.vue'
import cardLancamentos from '@/components/CardLancamentos.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: "paginaFilmes",
    components: {
        miniCards,
        cardLancamentos,
        alerta
    },
    data() {
        return {
            listaFilmes: [],
            destaque1: [],
            destaque2: [],
            listaRomance: [],
            listaAventura: [],
            listaDrama: [],
            listaTerror: [],
            listaAcao: [],
            aviso: false
        }
    },
    created() {
        this.tokenAccess = localStorage.getItem("token")
        if (this.tokenAccess) {
            const axios = require('axios')
            let endereço = "https://easy-password.up.railway.app/account/me/"
            let header = { authorization: "Bearer " + this.tokenAccess }
            let config = { headers: header }
            axios.get(endereço, config).catch(error => {
                if (error) {
                    this.$router.push('/login')
                    localStorage.removeItem('usuarioLogado')
                    localStorage.removeItem('token')
                }
            })
        } else {
            this.aviso = true
        }
        let terror = []
        let drama = []
        let comediaRomantica = []
        let aventura = []
        let acao = []
        this.listaAnimes = this.$store.state.listaDeFilmes
        this.listaAnimes.forEach(element => {
            if (element.categoria1 == 'Terror' || element.categoria1 == 'Suspense') {
                terror.push(element)
            }
            if (element.categoria1 == 'Drama' || element.categoria2 == 'Drama') {
                drama.push(element)
            }
            if (element.categoria1 == 'Romance') {
                comediaRomantica.push(element)
            }
            if (element.categoria2 == 'Aventura') {
                aventura.push(element)
            }
            if (element.categoria1 == 'Ação') {
                acao.push(element)
            }
        })
        this.listaAventura = aventura
        this.listaRomance = comediaRomantica
        this.listaAcao = acao
        this.listaDrama = drama
        this.listaTerror = terror
        this.listaFilmes = this.$store.state.listaDeFilmes
        let destaque1 = this.$store.state.listaDeEmAlta
        let destaque2 = this.$store.state.listaDeEmAlta
        destaque1.forEach(element => {
            if (element.nome == 'Homem-Aranha: Através do Aranhaverso') {
                this.destaque1.push(element)
            }
        })
        destaque2.forEach(element => {
            if (element.nome == 'Oppenheimer') {
                this.destaque2.push(element)
            }
        })
        window.scrollTo(0, 0);
    }
}
</script>
<style scoped>
.tela {
    padding: 2vw;
}

.conteiner-geral {
    display: flex;
    flex-direction: column;
    color: #e8e8e8;
    font-size: 3.5vh;
}

.grid {
    display: flex;
    gap: 2vw;
    flex-wrap: wrap;
}

.fileira-cards {
    display: flex;
    gap: 2vw;
    margin-bottom: 3vw;
    flex-wrap: wrap;
}

.titulo-fileira-cards {
    margin: 3vw 0 0 3vw;
}

.separacao {
    width: 97%;
    height: 1px;
    background-image: linear-gradient(to right, #898989, #1f1f1f);
    margin: 0 0 2vw 2vw;
}

@media screen and (max-width: 1000px) {
    .tela {
        padding: 4vw;
    }
    .grid{
        flex-wrap: nowrap;
        overflow-x: scroll;
    }

    .grid::-webkit-scrollbar {
        height: 0;
    }
    .titulo-fileira-cards{
        font-size: 0.9em;
    }
}
</style>