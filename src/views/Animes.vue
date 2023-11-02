<template>
    <div class="tela">
        <div v-for="anime in destaque1" :key="anime.id" >
            <cardLancamentos :nome="anime.nome" :imagem="anime.imagem" :imagemBanner="anime.imagemBanner" :nota="anime.nota"
                :categoria1="anime.categoria1" :categoria2="anime.categoria2" :thumbnail="anime.thumbnail"
                :imagemBannerFundo="anime.imagemBannerFundo" :categoria3="anime.categoria3"
                :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme" :faixaEtaria="anime.faixaEtaria"
                :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer" :direcao="anime.direcao" :elenco="anime.elenco"
                :roteiro="anime.roteiro" :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper"
                :sinopse="true" />
        </div>
        <!-- Cada component minicard esta recebendo uma prop, "nome", ":sinopse (se for verdadeiro, ao passar o mouse em cima exibira a sinopse)", 
            "conteudoSinopse (a sinopse em si)", "classificação" e a "categoria" -->
        <div class="conteiner-geral">
            <div class="titulo-fileira-cards">
                Sobrenatural
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="anime in listaSobrenatural" :key="anime.id" class="fileira-cards">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :thumbnail="anime.thumbnail" :categoria3="anime.categoria3"
                        :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                        :faixaEtaria="anime.faixaEtaria" :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer"
                        :direcao="anime.direcao" :elenco="anime.elenco" :roteiro="anime.roteiro"
                        :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Comédia Romantica
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="anime in listaRomance" :key="anime.id" class="fileira-cards">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :thumbnail="anime.thumbnail" :categoria3="anime.categoria3"
                        :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                        :faixaEtaria="anime.faixaEtaria" :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer"
                        :direcao="anime.direcao" :elenco="anime.elenco" :roteiro="anime.roteiro"
                        :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Mistério / Suspense
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="anime in listaSuspense" :key="anime.id" class="fileira-cards">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :thumbnail="anime.thumbnail" :categoria3="anime.categoria3"
                        :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                        :faixaEtaria="anime.faixaEtaria" :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer"
                        :direcao="anime.direcao" :elenco="anime.elenco" :roteiro="anime.roteiro"
                        :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Recomendação
            </div>
            <div class="separacao">
            </div>
            <div v-for="anime in destaque2" :key="anime.id">
                <cardLancamentos :nome="anime.nome" :imagem="anime.imagem" :imagemBanner="anime.imagemBanner"
                    :nota="anime.nota" :categoria1="anime.categoria1" :categoria2="anime.categoria2"
                    :thumbnail="anime.thumbnail" :imagemBannerFundo="anime.imagemBannerFundo" :categoria3="anime.categoria3"
                    :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme" :faixaEtaria="anime.faixaEtaria"
                    :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer" :direcao="anime.direcao"
                    :elenco="anime.elenco" :roteiro="anime.roteiro" :sinopseCompleta="anime.sinopseCompleta"
                    :wallpaper="anime.wallpaper" :sinopse="true" />
            </div>
            <div class="titulo-fileira-cards">
                Ação e Aventura
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="anime in listaAventura" :key="anime.id" class="fileira-cards">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :thumbnail="anime.thumbnail" :categoria3="anime.categoria3"
                        :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                        :faixaEtaria="anime.faixaEtaria" :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer"
                        :direcao="anime.direcao" :elenco="anime.elenco" :roteiro="anime.roteiro"
                        :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Comédia
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="anime in listaComedia" :key="anime.id" class="fileira-cards">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :thumbnail="anime.thumbnail" :categoria3="anime.categoria3"
                        :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                        :faixaEtaria="anime.faixaEtaria" :tipoDoTitulo="anime.tipoDoTitulo" :trailer="anime.trailer"
                        :direcao="anime.direcao" :elenco="anime.elenco" :roteiro="anime.roteiro"
                        :sinopseCompleta="anime.sinopseCompleta" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
        </div>
        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import miniCards from '@/components/MiniCards.vue'
import cardLancamentos from '@/components/CardLancamentos.vue'
import alerta from '@/components/msgAlerta.vue'
export default {
    name: 'paginaAnime',
    components: {
        miniCards,
        cardLancamentos,
        alerta
    },
    data() {
        return {
            listaAnimes: [],
            destaque1: [],
            destaque2: [],
            listaSobrenatural: [],
            listaComedia: [],
            listaAventura: [],
            listaRomance: [],
            listaSuspense: [],
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
        let sobrenatural = []
        let comedia = []
        let comediaRomantica = []
        let aventura = []
        let suspense = []
        this.listaAnimes = this.$store.state.listaDeAnimes
        this.listaAnimes.forEach(element => {
            if (element.categoria1 == 'Sobrenatural') {
                sobrenatural.push(element)
            }
            if (element.categoria1 == 'Comédia') {
                comedia.push(element)
            }
            if (element.categoria1 == 'Romance') {
                comediaRomantica.push(element)
            }
            if (element.categoria1 == 'Aventura' || element.categoria1 == 'Ação') {
                aventura.push(element)
            }
            if (element.categoria1 == 'Suspense' || element.categoria1 == 'Mistério') {
                suspense.push(element)
            }
        })
        this.listaAventura = aventura
        this.listaRomance = comediaRomantica
        this.listaSuspense = suspense
        this.listaComedia = comedia
        this.listaSobrenatural = sobrenatural
        let destaques = this.$store.state.listaDeEmAlta
        destaques.forEach(element => {
            if (element.nome == 'Sword Art Online: Alicization War of Underworld') {
                this.destaque1.push(element)
            }
            if (element.nome == 'Tate no Yuusha no Nariagari') {
                this.destaque2.push(element)
            }
        });
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