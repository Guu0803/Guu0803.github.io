<template>
    <div class="tela">
        <div v-for="serie in destaque1" :key="serie.id">
            <cardLancamentos :nome="serie.nome" :imagem="serie.imagem" :imagemBanner="serie.imagemBanner" :nota="serie.nota"
                :categoria1="serie.categoria1" :categoria2="serie.categoria2" :thumbnail="serie.thumbnail"
                :imagemBannerFundo="serie.imagemBannerFundo" :categoria3="serie.categoria3"
                :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme" :faixaEtaria="serie.faixaEtaria"
                :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer" :direcao="serie.direcao" :elenco="serie.elenco"
                :roteiro="serie.roteiro" :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper"
                :sinopse="true" />
        </div>
        <!-- Cada component minicard esta recebendo uma prop, "nome", ":sinopse (se for verdadeiro, ao passar o mouse em cima exibira a sinopse)", 
                "conteudoSinopse (a sinopse em si)", "classificação" e a "categoria" -->
        <div class="conteiner-geral">
            <div class="titulo-fileira-cards">
                Ação e Aventura
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="serie in listaAcao" :key="serie.id" class="fileira-cards">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :thumbnail="serie.thumbnail" :categoria3="serie.categoria3"
                        :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                        :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer"
                        :direcao="serie.direcao" :elenco="serie.elenco" :roteiro="serie.roteiro"
                        :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Terror
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="serie in listaTerror" :key="serie.id" class="fileira-cards">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :thumbnail="serie.thumbnail" :categoria3="serie.categoria3"
                        :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                        :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer"
                        :direcao="serie.direcao" :elenco="serie.elenco" :roteiro="serie.roteiro"
                        :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Drama Policial
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="serie in listaDramaPolicial" :key="serie.id" class="fileira-cards">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :thumbnail="serie.thumbnail" :categoria3="serie.categoria3"
                        :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                        :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer"
                        :direcao="serie.direcao" :elenco="serie.elenco" :roteiro="serie.roteiro"
                        :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Recomendação
            </div>
            <div class="separacao">
            </div>
            <div v-for="serie in destaque2" :key="serie.id">
                <cardLancamentos :nome="serie.nome" :imagem="serie.imagem" :imagemBanner="serie.imagemBanner"
                    :nota="serie.nota" :categoria1="serie.categoria1" :categoria2="serie.categoria2"
                    :thumbnail="serie.thumbnail" :imagemBannerFundo="serie.imagemBannerFundo" :categoria3="serie.categoria3"
                    :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme" :faixaEtaria="serie.faixaEtaria"
                    :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer" :direcao="serie.direcao"
                    :elenco="serie.elenco" :roteiro="serie.roteiro" :sinopseCompleta="serie.sinopseCompleta"
                    :wallpaper="serie.wallpaper" :sinopse="true" />
            </div>

            <div class="titulo-fileira-cards">
                Fantasia
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="serie in listaAventuraFantasia" :key="serie.id" class="fileira-cards">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :thumbnail="serie.thumbnail" :categoria3="serie.categoria3"
                        :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                        :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer"
                        :direcao="serie.direcao" :elenco="serie.elenco" :roteiro="serie.roteiro"
                        :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="titulo-fileira-cards">
                Comédia
            </div>
            <div class="separacao">
            </div>
            <div class="grid">
                <div v-for="serie in listaComedia" :key="serie.id" class="fileira-cards">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :thumbnail="serie.thumbnail" :categoria3="serie.categoria3"
                        :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                        :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer"
                        :direcao="serie.direcao" :elenco="serie.elenco" :roteiro="serie.roteiro"
                        :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
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
    name: "paginaSeries",
    components: {
        miniCards,
        cardLancamentos,
        alerta
    },
    data() {
        return {
            listaSeries: [],
            destaque1: [],
            destaque2: [],
            listaAcao: [],
            listaTerror: [],
            listaComedia: [],
            listaDramaPolicial: [],
            listaAventuraFantasia: [],
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
        this.listaSeries = this.$store.state.listaDeSeries
        let acao = []
        let comedia = []
        let terror = []
        let dramaPolicial = []
        let fantasiaAventura = []
        this.listaSeries.forEach(element => {
            if (element.categoria1 == 'Aventura' || element.categoria1 == 'Ficção' || element.nome == 'Agente Noturno') {
                acao.push(element)
            }
            if (element.categoria1 == 'Comédia') {
                comedia.push(element)
            }
            if (element.categoria1 == 'Terror') {
                terror.push(element)
            }
            if (element.categoria1 == 'Policial' || element.nome == 'Segurança em Jogo') {
                dramaPolicial.push(element)
            }
            if (element.categoria1 == 'Fantasia' || element.nome == 'The Last Of Us') {
                fantasiaAventura.push(element)
            }
        })
        this.listaAcao = acao
        this.listaComedia = comedia
        this.listaTerror = terror
        this.listaDramaPolicial = dramaPolicial
        this.listaAventuraFantasia = fantasiaAventura
        let destaque1 = this.$store.state.listaDeEmAlta
        let destaque2 = this.$store.state.listaDeSeries
        destaque1.forEach(element => {
            if (element.nome == 'The Withcer') {
                this.destaque1.push(element)
            }
        });
        destaque2.forEach(element => {
            if (element.nome == 'Dr. House') {
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