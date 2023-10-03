<template>
    <div class="tela">
        <!-- Banner principal -->
        <div class="grid">
            <span class="material-icons botao-volta" v-on:click="passarAnterior()">
                chevron_left
            </span>

            <div v-for="(banner, index) in listaBanners" :key="banner.id">
                <banner :nome="banner.nome" :imagem="banner.imagem" :nota="banner.nota" :imagemBanner="banner.imagemBanner"
                    :categoria1="banner.categoria1" :categoria2="banner.categoria2" :categoria3="banner.categoria3"
                    :resumoSinopse="banner.resumoSinopse" :duracaoFilme="banner.duracaoFilme"
                    :faixaEtaria="banner.faixaEtaria" :tipoDoTitulo="banner.tipoDoTitulo" :trailer="banner.trailer"
                    :direcao="banner.direcao" :elenco="banner.elenco" :roteiro="banner.roteiro"
                    :sinopseCompleta="banner.sinopseCompleta" :wallpaper="banner.wallpaper" v-if="index == pagina" />
            </div>

            <span class="material-icons botao-proximo" v-on:click="passarFrente()">
                chevron_right
            </span>

            <div class="conteiner-dots">
                <span class="material-icons dot" v-on:click="dotAlterar1()" :style="dotSelecionado1()">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar2()" :style="dotSelecionado2()">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar3()" :style="dotSelecionado3()">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar4()" :style="dotSelecionado4()">
                    fiber_manual_record
                </span>
            </div>
        </div>
        <!-- Fim -->

        <!-- Carrosel Series  -->
        <div class="titulo-fileiras">
            <router-link to="/series" class="link-titulo">
                Séries
            </router-link>
        </div>
        <div class="separacao">
        </div>
        <div class="conteiner-cards">
            <div class="fileira-cards">
                <span class="material-icons seta" v-on:click="voltarSeries()">
                    keyboard_arrow_left
                </span>
                <div v-for="serie in  recomendacaoListaSeries" :key="serie.id" class="card">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :scale="true"
                        :categoria1="serie.categoria1" :categoria2="serie.categoria2" :thumbnail="serie.thumbnail"
                        :categoria3="serie.categoria3" :resumoSinopse="serie.resumoSinopse"
                        :duracaoFilme="serie.duracaoFilme" :faixaEtaria="serie.faixaEtaria"
                        :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer" :direcao="serie.direcao"
                        :elenco="serie.elenco" :roteiro="serie.roteiro" :sinopseCompleta="serie.sinopseCompleta"
                        :wallpaper="serie.wallpaper" />
                </div>
                <div v-for="serie in  listaSeries" :key="serie.id" class="card-mobile">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :scale="true"
                        :categoria1="serie.categoria1" :categoria2="serie.categoria2" :thumbnail="serie.thumbnail"
                        :categoria3="serie.categoria3" :resumoSinopse="serie.resumoSinopse"
                        :duracaoFilme="serie.duracaoFilme" :faixaEtaria="serie.faixaEtaria"
                        :tipoDoTitulo="serie.tipoDoTitulo" :trailer="serie.trailer" :direcao="serie.direcao"
                        :elenco="serie.elenco" :roteiro="serie.roteiro" :sinopseCompleta="serie.sinopseCompleta"
                        :wallpaper="serie.wallpaper" />
                </div>
                <span class="material-icons seta" v-on:click="passarSeries()">
                    keyboard_arrow_right
                </span>
            </div>



        </div>
        <!-- Fim -->

        <!-- Carrosel em Alta -->
        <div class="titulo-fileiras ">
            Em alta
        </div>
        <div class="separacao">
        </div>
        <div class="conteiner-cards">
            <div class="fileira-cards-em-alta">
                <span class="material-icons seta" v-on:click="voltarEmAlta()">
                    keyboard_arrow_left
                </span>
                <div v-for="destaques in recomendacaoListaEmAlta" :key="destaques.id" class="card">
                    <cards :nome="destaques.nome" :imagem="destaques.imagem" :nota="destaques.nota" :scale="true"
                        :categoria1="destaques.categoria1" :categoria2="destaques.categoria2"
                        :thumbnail="destaques.thumbnail" :categoria3="destaques.categoria3"
                        :resumoSinopse="destaques.resumoSinopse" :duracaoFilme="destaques.duracaoFilme"
                        :faixaEtaria="destaques.faixaEtaria" :tipoDoTitulo="destaques.tipoDoTitulo"
                        :trailer="destaques.trailer" :direcao="destaques.direcao" :elenco="destaques.elenco"
                        :roteiro="destaques.roteiro" :sinopseCompleta="destaques.sinopseCompleta"
                        :wallpaper="destaques.wallpaper" />
                </div>
                <div v-for="destaques in listaEmAlta" :key="destaques.id" class="card-mobile">
                    <cards :nome="destaques.nome" :imagem="destaques.imagem" :nota="destaques.nota" :scale="true"
                        :categoria1="destaques.categoria1" :categoria2="destaques.categoria2"
                        :thumbnail="destaques.thumbnail" :categoria3="destaques.categoria3"
                        :resumoSinopse="destaques.resumoSinopse" :duracaoFilme="destaques.duracaoFilme"
                        :faixaEtaria="destaques.faixaEtaria" :tipoDoTitulo="destaques.tipoDoTitulo"
                        :trailer="destaques.trailer" :direcao="destaques.direcao" :elenco="destaques.elenco"
                        :roteiro="destaques.roteiro" :sinopseCompleta="destaques.sinopseCompleta"
                        :wallpaper="destaques.wallpaper" />
                </div>
                <span class="material-icons seta" v-on:click="passarEmAlta()">
                    keyboard_arrow_right
                </span>
            </div>


        </div>
        <!-- Fim -->

        <!-- Carrosel Filmes -->
        <div class="titulo-fileiras">
            <router-link to="/filmes" class="link-titulo">
                Filmes
            </router-link>
        </div>
        <div class="separacao">
        </div>
        <div class="conteiner-cards">
            <div class="fileira-cards">
                <span class="material-icons seta" v-on:click="voltarFilmes()">
                    keyboard_arrow_left
                </span>
                <div v-for="filme in recomendacaoListaFilmes" :key="filme.id" class="card">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :scale="true"
                        :categoria1="filme.categoria1" :categoria2="filme.categoria2" :thumbnail="filme.thumbnail"
                        :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria"
                        :tipoDoTitulo="filme.tipoDoTitulo" :trailer="filme.trailer" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :sinopseCompleta="filme.sinopseCompleta"
                        :wallpaper="filme.wallpaper" />
                </div>
                <div v-for="filme in listaFilmes" :key="filme.id" class="card-mobile">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :scale="true"
                        :categoria1="filme.categoria1" :categoria2="filme.categoria2" :thumbnail="filme.thumbnail"
                        :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria"
                        :tipoDoTitulo="filme.tipoDoTitulo" :trailer="filme.trailer" :direcao="filme.direcao"
                        :elenco="filme.elenco" :roteiro="filme.roteiro" :sinopseCompleta="filme.sinopseCompleta"
                        :wallpaper="filme.wallpaper" />
                </div>
                <span class="material-icons seta" v-on:click="passarFilmes()">
                    keyboard_arrow_right
                </span>
            </div>
        </div>
        <!-- Fim -->

        <!-- Carrosel animes -->
        <div class="titulo-fileiras">
            <router-link to="/animes" class="link-titulo">
                Animes
            </router-link>
        </div>
        <div class="separacao">
        </div>
        <div class="conteiner-cards">

            <div class="fileira-cards">
                <span class="material-icons seta" v-on:click="voltarAnimes()">
                    keyboard_arrow_left
                </span>
                <div v-for="banner in recomendacaoListaAnimes" :key="banner.id">
                    <miniCards :nome="banner.nome" :imagem="banner.imagem" :nota="banner.nota" :scale="true"
                        :categoria1="banner.categoria1" :categoria2="banner.categoria2" :thumbnail="banner.thumbnail"
                        :categoria3="banner.categoria3" :resumoSinopse="banner.resumoSinopse"
                        :duracaoFilme="banner.duracaoFilme" :faixaEtaria="banner.faixaEtaria"
                        :tipoDoTitulo="banner.tipoDoTitulo" :trailer="banner.trailer" :direcao="banner.direcao"
                        :elenco="banner.elenco" :roteiro="banner.roteiro" :sinopseCompleta="banner.sinopseCompleta"
                        :wallpaper="banner.wallpaper" />
                </div>
                <span class="material-icons seta" v-on:click="passarAnimes()">
                    keyboard_arrow_right
                </span>
            </div>

        </div>
        <!-- FIm -->
        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import miniCards from '@/components/MiniCards.vue'
import banner from '@/components/Baners.vue'
import cards from '@/components/Cards.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: "pagina-inicio",
    components: {
        miniCards,
        banner,
        cards,
        alerta
    },
    data() {
        return {
            pagina: 0,
            listaBanners: [],
            listaSeries: [],
            listaFilmes: [],
            listaAnimes: [],
            listaEmAlta: [],
            recomendacaoIndexSeries: 0,
            recomendacaoIndexAnimes: 0,
            recomendacaoIndexFilmes: 0,
            recomendacaoIndexEmAlta: 0,
            aviso: false
        }
    },
    computed: {
        recomendacaoListaSeries() {
            return this.listaSeries.slice(this.recomendacaoIndexSeries, this.recomendacaoIndexSeries + 6)
        },
        recomendacaoListaAnimes() {
            return this.listaAnimes.slice(this.recomendacaoIndexAnimes, this.recomendacaoIndexAnimes + 6)
        },
        recomendacaoListaFilmes() {
            return this.listaFilmes.slice(this.recomendacaoIndexFilmes, this.recomendacaoIndexFilmes + 6)
        },
        recomendacaoListaEmAlta() {
            return this.listaEmAlta.slice(this.recomendacaoIndexEmAlta, this.recomendacaoIndexEmAlta + 3)
        }
    },
    methods: {
        dotSelecionado1() {
            if (this.pagina == 0) {
                return "color: #e8e8e8;"
            }
        },
        dotSelecionado2() {
            if (this.pagina == 1) {
                return "color: #e8e8e8;"
            }
        },
        dotSelecionado3() {
            if (this.pagina == 2) {
                return "color: #e8e8e8;"
            }
        },
        dotSelecionado4() {
            if (this.pagina == 3) {
                return "color: #e8e8e8;"
            }
        },
        dotAlterar1() {
            if (this.pagina != 0) {
                this.pagina = 0

            }
        },
        dotAlterar2() {
            if (this.pagina != 1) {
                this.pagina = 1
            }
        },
        dotAlterar3() {
            if (this.pagina != 2) {
                this.pagina = 2
            }
        },
        dotAlterar4() {
            if (this.pagina != 3) {
                this.pagina = 3
            }
        },
        passarFrente() {
            if (this.pagina >= 3) {
                this.pagina = 0
            } else {
                this.pagina++
            }
        },
        passarAnterior() {
            if (this.pagina <= 0) {
                this.pagina = 3
            } else {
                this.pagina--
            }
        },
        passarSeries() {
            if (this.recomendacaoIndexSeries < 6) {
                this.recomendacaoIndexSeries = this.recomendacaoIndexSeries + 6
            } else {
                this.recomendacaoIndexSeries = 0
            }
        },
        voltarSeries() {
            if (this.recomendacaoIndexSeries < 0) {
                this.recomendacaoIndexSeries = this.recomendacaoIndexSeries - 6
            } else {
                this.recomendacaoIndexSeries = 6
            }
        },
        passarFilmes() {
            if (this.recomendacaoIndexFilmes < 6) {
                this.recomendacaoIndexFilmes = this.recomendacaoIndexFilmes + 6
            } else {
                this.recomendacaoIndexFilmes = 0
            }
        },
        voltarFilmes() {
            if (this.recomendacaoIndexFilmes < 0) {
                this.recomendacaoIndexFilmes = this.recomendacaoIndexFilmes - 6
            } else {
                this.recomendacaoIndexFilmes = 6
            }
        },
        passarEmAlta() {
            if (this.recomendacaoIndexEmAlta < 3) {
                this.recomendacaoIndexEmAlta = this.recomendacaoIndexEmAlta + 3
            } else {
                this.recomendacaoIndexEmAlta = 0
            }
        },
        voltarEmAlta() {
            if (this.recomendacaoIndexEmAlta < 0) {
                this.recomendacaoIndexEmAlta = this.recomendacaoIndexEmAlta - 3
            } else {
                this.recomendacaoIndexEmAlta = 3
            }
        },
        passarAnimes() {
            if (this.recomendacaoIndexAnimes < 6) {
                this.recomendacaoIndexAnimes = this.recomendacaoIndexAnimes + 6
            } else {
                this.recomendacaoIndexAnimes = 0
            }
        },
        voltarAnimes() {
            if (this.recomendacaoIndexAnimes < 0) {
                this.recomendacaoIndexAnimes = this.recomendacaoIndexAnimes - 6
            } else {
                this.recomendacaoIndexAnimes = 0

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
        this.listaBanners = this.$store.state.filmesBannerHome
        this.listaAnimes = this.$store.state.listaDeAnimes
        this.listaSeries = this.$store.state.listaDeSeries
        this.listaFilmes = this.$store.state.listaDeFilmes
        this.listaEmAlta = this.$store.state.listaDeEmAlta
        window.scrollTo(0, 0);
    }

}
</script>
<style scoped>
.tela {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.grid {
    gap: 2vw;
    width: 95vw;
    flex-wrap: nowrap;
    margin: 2vw 0;
    align-items: center;
    position: relative;
    border-radius: 10px;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
}

.botao-volta,
.botao-proximo {
    position: absolute;
    cursor: pointer;
    color: #B2B2B2;
    font-size: 10vh;
    transition: 200ms ease-in-out 3s;
    opacity: 0;
    top: 45%;

}

.botao-volta {
    left: 0;
    z-index: 1;
}

.botao-proximo {
    right: 0;
    z-index: 5;
}

.botao-proximo:hover,
.botao-volta:hover {
    color: #e8e8e8;
}

.grid:hover>.botao-volta {
    opacity: 1;
    transition: 200ms ease-in-out;
}

.grid:hover>.botao-proximo {
    opacity: 1;
    transition: 200ms ease-in-out;
}

.conteiner-dots {
    position: absolute;
    bottom: 1vw;
    color: #B2B2B250;
    display: flex;
    gap: 1vw;
    opacity: 0;
    transition: 200ms ease-in-out 3s;
    width: 100%;
    justify-content: center;
}

.dot {
    font-size: 2.5vh;
    cursor: pointer;
}

.dot:hover {
    color: #e8e8e8;
}

.grid:hover>.conteiner-dots {
    opacity: 1;
    transition: 200ms ease-in-out;
}

.botao-volta:hover,
.botao-proximo:hover {
    color: #e8e8e8;
}

.separacao {
    width: 95%;
    height: 1px;
    background-image: linear-gradient(to right, #898989, #1f1f1f);
    margin: 0 0 3vh 4vw;
}

.titulo-fileiras {
    margin-top: 3vh;
    cursor: pointer;
    width: 80%;
    color: #e8e8e8;
    font-size: 4vh;
}

.link-titulo {
    text-decoration: none;
    color: #e8e8e8;

}

.link-titulo:hover {
    color: #f64348;
}

.conteiner-cards {
    display: flex;
    color: #898989;
    justify-content: center;
    align-items: center;
    width: 100%;

}

.card-mobile {
    display: none;
}

.fileira-cards {
    width: 100%;
    height: fit-content;
    padding: 1.4vw 0 1.4vw 1.5vh;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 1.6vw;
    overflow: hidden;
}


.fileira-cards-em-alta {
    width: 85vw;
    height: fit-content;
    padding-bottom: 2vh;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 2vw;
    overflow: hidden;
}

.seta {
    font-size: 5vh;
    cursor: pointer;
    transition: 300ms ease-in-out;
    margin: -10vh -2vh 0 -2vh;
}

.seta:hover {
    color: #e8e8e8;
    transition: 300ms;
}



@media screen and (max-width:1000px) {

    .grid {
        margin-top: 3vh;
    }

    .botao-volta,
    .botao-proximo {
        font-size: 2em;
        opacity: 1;
    }

    .card {
        display: none;
    }

    .card-mobile {
        display: block;
    }

    .dot {
        font-size: 0.5em;
    }

    .titulo-fileiras {
        font-size: 1.3em;
    }

    .fileira-cards {
        height: fit-content;
        justify-content: unset;
        overflow-x: scroll;
        align-items: center;
    }

    .fileira-cards-em-alta {
        height: 55vh;
        width: 100%;
        justify-content: unset;
        padding: 1.4vw 0 1.4vw 3vh;
        box-sizing: border-box;
        overflow-x: scroll;
        gap: 5vw;
    }

    .fileira-cards-em-alta::-webkit-scrollbar {
        height: 0;
    }

    .fileira-cards::-webkit-scrollbar {
        height: 0;
    }

    .seta {
        display: none;
    }

}
</style>