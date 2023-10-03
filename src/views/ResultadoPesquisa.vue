<template>
    <div class="tela">
        <div class="filtro">
            <div class="titulo-pesquisa">
                Aqui estão resultados para " {{ pegarTextoPesquisa }} "
            </div>
            <div v-if="this.filtroSeries.length != 0">
                <div class="titulo-fileira-cards">
                    Series
                </div>
                <div class="separacao">
                </div>
                <div class="grid">
                    <div v-for="serie in filtroSeries" :key="serie.id" class="fileira-cards">
                        <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota"
                            :categoria1="serie.categoria1" :categoria2="serie.categoria2" :categoria3="serie.categoria3"
                            :resumoSinopse="serie.resumoSinopse" :duracaoFilme="serie.duracaoFilme"
                            :faixaEtaria="serie.faixaEtaria" :tipoDoTitulo="serie.tipoDoTitulo"
                            :sinopseCompleta="serie.sinopseCompleta" :wallpaper="serie.wallpaper" :sinopse="true" />
                    </div>
                </div>
            </div>
            <div v-if="this.filtroFilmes.length != 0">
                <div class="titulo-fileira-cards">
                    Filmes
                </div>
                <div class="separacao">
                </div>
                <div class="grid">
                    <div v-for="filme in filtroFilmes" :key="filme.id" class="fileira-cards">
                        <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota"
                            :categoria1="filme.categoria1" :categoria2="filme.categoria2" :categoria3="filme.categoria3"
                            :resumoSinopse="filme.resumoSinopse" :duracaoFilme="filme.duracaoFilme"
                            :faixaEtaria="filme.faixaEtaria" :sinopseCompleta="filme.sinopseCompleta"
                            :wallpaper="filme.wallpaper" :tipoDoTitulo="filme.tipoDoTitulo" :sinopse="true" />
                    </div>
                </div>
            </div>

            <div v-if="this.filtroAnimes.length != 0">
                <div class="titulo-fileira-cards">
                    Animes
                </div>
                <div class="separacao">
                </div>
                <div class="grid">
                    <div v-for="anime in filtroAnimes" :key="anime.id" class="fileira-cards">
                        <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota"
                            :categoria1="anime.categoria1" :categoria2="anime.categoria2" :categoria3="anime.categoria3"
                            :resumoSinopse="anime.resumoSinopse" :duracaoFilme="anime.duracaoFilme"
                            :faixaEtaria="anime.faixaEtaria" :sinopseCompleta="anime.sinopseCompleta"
                            :wallpaper="anime.wallpaper" :sinopse="true" :download="anime.download"
                            :adicionadoNaLista="anime.adicionadoNaLista" :tipoDoTitulo="anime.tipoDoTitulo" />
                    </div>
                </div>
            </div>
        </div>
        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import miniCards from '@/components/MiniCards.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: 'paginaResultadoPesquisa',
    components: {
        miniCards,
        alerta
    },
    data() {
        return {
            listaAnimes: [],
            listaFilmes: [],
            listaSeries: [],
            filtroAnimes: [],
            filtroSeries: [],
            filtroFilmes: [],
            aviso: false
        }
    },
    computed: {
        pegarTextoPesquisa() {
            this.$store.state.textoPesquisa
            return this.$store.state.textoPesquisa
        }
    },
    methods:{
        filter(value){
            if (value.length > 0) {
                let pesquisaAnimes = []
                let pesquisaFilmes = []
                let pesquisaSeries = []
                for (let index = 0; index < this.listaAnimes.length; index++) {
                    const element = this.listaAnimes[index];
                    if (element.nome.toLowerCase().includes(value.toLowerCase()) == true) {
                        pesquisaAnimes.push(element)
                        this.filtroAnimes = pesquisaAnimes
                        // (this.conteudoPesquisa.charAt(0).toUpperCase()+this.conteudoPesquisa.slice(1)) essa linha de codigo transforma a primeira letra em maiuscula
                    } else {
                        this.filtroAnimes = pesquisaAnimes
                    }
                }
                for (let index = 0; index < this.listaFilmes.length; index++) {
                    const element = this.listaFilmes[index];
                    if (element.nome.toLowerCase().includes(value.toLowerCase()) == true) {
                        pesquisaFilmes.push(element)
                        this.filtroFilmes = pesquisaFilmes
                    }
                }
                for (let index = 0; index < this.listaSeries.length; index++) {
                    const element = this.listaSeries[index];
                    if (element.nome.toLowerCase().includes(value.toLowerCase()) == true) {
                        pesquisaSeries.push(element)
                        this.filtroSeries = pesquisaSeries
                    } else {
                        this.filtroSeries = pesquisaSeries
                    }
                }
            } else {
                this.$router.go(-1)
            }
        }
    },
    watch: {
        pegarTextoPesquisa(value) {
            this.filter(value)
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
        this.listaAnimes = this.$store.state.listaDeAnimes
        this.listaFilmes = this.$store.state.listaDeFilmes

        this.filter(this.pegarTextoPesquisa)

    }
}

</script>
<style scoped>
.filtro {
    color: #e8e8e8;
    font-size: 3vh;
    padding: 3vw;
    display: flex;
    flex-direction: column;
    gap: 2vw;
}

.titulo-pesquisa {
    margin-left: 4vw;
}

.grid {
    display: flex;
    gap: 2vw;
    flex-wrap: wrap;
}

.titulo-fileira-cards {
    margin-left: 3vw;
}

.separacao {
    width: 97%;
    height: 1px;
    background-image: linear-gradient(to right, #898989, #1f1f1f);
    margin: 0 0 1vw 2vw;
}

.fileira-cards {
    display: flex;
    gap: 2vw;
}




@media screen and (max-width:1000px) {
    
    .grid{
        margin-top: 3vh;
        flex-wrap: nowrap;
        overflow-x: scroll;
    }
    
    .fileira-cards {
        height: fit-content;
        justify-content: unset;
       
        align-items: center;
    }

    .grid::-webkit-scrollbar {
        height: 0;
    }

    

}
</style>