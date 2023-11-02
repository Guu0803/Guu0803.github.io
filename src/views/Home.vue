<template>
    <div class="tela">
        <!-- Banner principal -->
        <div class="grid" v-on:mouseover="pausarBanner()" v-on:mouseleave="playBanner()">
            <span class="material-icons botao-volta" v-on:click="passarAnterior()">
                chevron_left
            </span>
            <div id="banner-container">
                <div v-for="banner in listaBanners" :key="banner.id">
                    <banner :nome="banner.nome" :imagem="banner.imagem" :nota="banner.nota"
                        :imagemBanner="banner.imagemBanner" :categoria1="banner.categoria1" :categoria2="banner.categoria2"
                        :categoria3="banner.categoria3" :resumoSinopse="banner.resumoSinopse"
                        :duracaoFilme="banner.duracaoFilme" :faixaEtaria="banner.faixaEtaria"
                        :tipoDoTitulo="banner.tipoDoTitulo" :trailer="banner.trailer" :direcao="banner.direcao"
                        :elenco="banner.elenco" :roteiro="banner.roteiro" :sinopseCompleta="banner.sinopseCompleta"
                        :wallpaper="banner.wallpaper" />
                </div>
            </div>
            <span class="material-icons botao-proximo" v-on:click="passarFrente()">
                chevron_right
            </span>

            <div class="conteiner-dots">
                <span class="material-icons dot" v-on:click="dotAlterar('0')" :style="dotSelecionado('0')">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar('1')" :style="dotSelecionado('1')">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar('2')" :style="dotSelecionado('2')">
                    fiber_manual_record
                </span>
                <span class="material-icons dot" v-on:click="dotAlterar('3')" :style="dotSelecionado('3')">
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
            <span class="material-icons seta-esquerda" v-on:click="voltarMiniCards('serie')">
                keyboard_arrow_left
            </span>
            <div class="row">
                <div id="serie-carrosel">
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
                </div>
            </div>
            <span class="material-icons seta-direita" v-on:click="passarMiniCards('serie')">
                keyboard_arrow_right
            </span>
        </div>
        <!-- Fim -->

        <!-- Carrosel em Alta -->
        <div class="titulo-fileiras ">
            Em alta
        </div>
        <div class="separacao">
        </div>
        <div class="conteiner-cards-em-alta">
            <span class="material-icons seta-esquerda" v-on:click="voltarEmAlta()">
                keyboard_arrow_left
            </span>
            <div class="row-em-alta">
                <div id="em-alta-carrosel">
                    <div v-for="destaques in listaEmAlta" :key="destaques.id">
                        <cards :nome="destaques.nome" :imagem="destaques.imagem" :nota="destaques.nota" :scale="true"
                            :categoria1="destaques.categoria1" :categoria2="destaques.categoria2"
                            :thumbnail="destaques.thumbnail" :categoria3="destaques.categoria3"
                            :resumoSinopse="destaques.resumoSinopse" :duracaoFilme="destaques.duracaoFilme"
                            :faixaEtaria="destaques.faixaEtaria" :tipoDoTitulo="destaques.tipoDoTitulo"
                            :trailer="destaques.trailer" :direcao="destaques.direcao" :elenco="destaques.elenco"
                            :roteiro="destaques.roteiro" :sinopseCompleta="destaques.sinopseCompleta"
                            :wallpaper="destaques.wallpaper" />
                    </div>
                </div>
            </div>
            <span class="material-icons seta-direita" v-on:click="passarEmAlta()">
                keyboard_arrow_right
            </span>
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
            <span class="material-icons seta-esquerda" v-on:click="voltarMiniCards('filme')">
                keyboard_arrow_left
            </span>
            <div class="row">
                <div id="filme-carrosel">
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
                </div>
            </div>
            <span class="material-icons seta-direita" v-on:click="passarMiniCards('filme')">
                keyboard_arrow_right
            </span>
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
            <span class="material-icons seta-esquerda" v-on:click="voltarMiniCards('anime')">
                keyboard_arrow_left
            </span>
            <div class="row">
                <div id="anime-carrosel">
                    <div v-for="banner in recomendacaoListaAnimes" :key="banner.id">
                        <miniCards :nome="banner.nome" :imagem="banner.imagem" :nota="banner.nota" :scale="true"
                            :categoria1="banner.categoria1" :categoria2="banner.categoria2" :thumbnail="banner.thumbnail"
                            :categoria3="banner.categoria3" :resumoSinopse="banner.resumoSinopse"
                            :duracaoFilme="banner.duracaoFilme" :faixaEtaria="banner.faixaEtaria"
                            :tipoDoTitulo="banner.tipoDoTitulo" :trailer="banner.trailer" :direcao="banner.direcao"
                            :elenco="banner.elenco" :roteiro="banner.roteiro" :sinopseCompleta="banner.sinopseCompleta"
                            :wallpaper="banner.wallpaper" />
                    </div>
                    <div v-for="banner in recomendacaoListaAnimes" :key="banner.id" class="card-mobile">
                        <miniCards :nome="banner.nome" :imagem="banner.imagem" :nota="banner.nota" :scale="true"
                            :categoria1="banner.categoria1" :categoria2="banner.categoria2" :thumbnail="banner.thumbnail"
                            :categoria3="banner.categoria3" :resumoSinopse="banner.resumoSinopse"
                            :duracaoFilme="banner.duracaoFilme" :faixaEtaria="banner.faixaEtaria"
                            :tipoDoTitulo="banner.tipoDoTitulo" :trailer="banner.trailer" :direcao="banner.direcao"
                            :elenco="banner.elenco" :roteiro="banner.roteiro" :sinopseCompleta="banner.sinopseCompleta"
                            :wallpaper="banner.wallpaper" />
                    </div>
                </div>
            </div>
            <span class="material-icons seta-direita" v-on:click="passarMiniCards('anime')">
                keyboard_arrow_right
            </span>
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
            aviso: false,
            posiçãoInicial: 0,
            posiçãoInicialEmAlta: 0,
            bannerAtivado: true
        }
    },
    computed: {
        recomendacaoListaSeries() {
            return this.listaSeries.slice(0, 12)
        },
        recomendacaoListaAnimes() {
            return this.listaAnimes.slice(0, 12)
        },
        recomendacaoListaFilmes() {
            return this.listaFilmes.slice(0, 12)
        },
        recomendacaoListaEmAlta() {
            return this.listaEmAlta.slice(0, 12)
        }
    },
    methods: {
        dotSelecionado(pagina) {
            if (this.pagina == pagina) {
                return "color: #e8e8e8;"
            }
        },
        dotAlterar(pagina) {
            this.pagina = pagina
            let proximo = document.getElementById('banner-container')
            let position = -97.5 * pagina
            proximo.style.left = position + 'vw'

        },
        passarFrente() {
            if (this.pagina >= 4) {
                this.pagina = 0
                let proximo = document.getElementById('banner-container')
                proximo.style.transition = 'unset'
                proximo.style.left = '0'
                setTimeout(() => {
                    proximo.style.transition = 'left 1s ease-in-out'
                    this.passarFrente()
                }, 100);
            } else {
                this.pagina++
                let proximo = document.getElementById('banner-container')
                let position = -97.5 * this.pagina
                proximo.style.left = position + 'vw'
            }
        },
        passarAnterior() {
            if (this.pagina <= 0) {
                this.pagina = 4
                let anterior = document.getElementById('banner-container')
                anterior.style.transition = 'unset'
                anterior.style.left = '-390vw'
                setTimeout(() => {
                    anterior.style.transition = 'left 1s ease-in-out'
                    this.passarAnterior()
                }, 100);
            } else {
                this.pagina--
                let anterior = document.getElementById('banner-container')
                let position = -97.5 * this.pagina
                anterior.style.left = position + 'vw'
            }
        },
        passarMiniCards(tipo) {
            if (this.posiçãoInicial == -93) return
            let proximo = document.getElementById(tipo + '-carrosel')
            let newPosition = this.posiçãoInicial - 15.5
            this.posiçãoInicial = newPosition
            proximo.style.left = newPosition + 'vw'

        },
        voltarMiniCards(tipo) {
            if (this.posiçãoInicial == 0) return
            let anterior = document.getElementById(tipo + '-carrosel')
            let newPosition = this.posiçãoInicial + 15.5
            this.posiçãoInicial = newPosition
            anterior.style.left = newPosition + 'vw'
        },
        passarEmAlta() {
            if (this.posiçãoInicial == -60) return
            let proximo = document.getElementById('em-alta-carrosel')
            let newPosition = this.posiçãoInicialEmAlta - 30
            this.posiçãoInicialEmAlta = newPosition
            proximo.style.left = newPosition + 'vw'
        },
        voltarEmAlta() {
            if (this.posiçãoInicialEmAlta == 0) return
            let anterior = document.getElementById('em-alta-carrosel')
            let newPosition = this.posiçãoInicialEmAlta + 30
            this.posiçãoInicialEmAlta = newPosition
            anterior.style.left = newPosition + 'vw'
        },
        rodarBanner() {
            setInterval(() => {
                if(this.bannerAtivado == false) return
                if (this.pagina >= 4) {
                    this.pagina = 0
                    let proximo = document.getElementById('banner-container')
                    proximo.style.transition = 'unset'
                    proximo.style.left = '0'
                    setTimeout(() => {
                        proximo.style.transition = 'left 1s ease-in-out'
                    }, 100);
                } else {
                    this.pagina++
                    let proximo = document.getElementById('banner-container')
                    let position = -97.5 * this.pagina
                    proximo.style.left = position + 'vw'
                }
            }, 4000);
        },
        pausarBanner(){
            this.bannerAtivado =  false
        },
        playBanner(){
            this.bannerAtivado =  true
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

        this.listaBanners = this.$store.state.filmesBannerHome
        this.listaAnimes = this.$store.state.listaDeAnimes
        this.listaSeries = this.$store.state.listaDeSeries
        this.listaFilmes = this.$store.state.listaDeFilmes
        this.listaEmAlta = this.$store.state.listaDeEmAlta

        window.scrollTo(0, 0);

        this.listaBanners.push(this.listaBanners[0])

        this.rodarBanner()
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
    margin: 2vw 0;
    position: relative;
    border-radius: 10px;
    box-shadow: 1.5vh 1.5vh 2vh black, -1.5vh -1.5vh 2vh #343434;
    height: 70vh;
    overflow: hidden;
}

#banner-container {
    display: flex;
    gap: 2.5vw;
    position: absolute;
    left: 0;
    transition: left 1s ease-in-out;
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

.conteiner-cards,
.conteiner-cards-em-alta {
    display: flex;
    color: #898989;
    align-items: center;
    position: relative;
}

.conteiner-cards-em-alta {
    height: 75vh;
    margin-bottom: 5vh;
}

.row,
.row-em-alta {
    position: relative;
    overflow: hidden;
    display: flex;
}

.row {
    height: 55vh;
    width: 94vw;
}

.row-em-alta {
    height: 80vh;
    width: 90vw;
}

#serie-carrosel,
#filme-carrosel,
#anime-carrosel,
#em-alta-carrosel {
    display: flex;
    align-items: center;
    gap: 1.5vw;
    padding: 3vh 0 0 1.2vw;
    position: absolute;
    transition: left 0.5s ease-in-out;
    left: 0;
}

#em-alta-carrosel {
    padding: 0 2vw 0 2vw;
    gap: 5vw;
}

.card-mobile {
    display: none;
}

.seta-direita,
.seta-esquerda {
    font-size: 7vh;
    cursor: pointer;
    transition: 300ms ease-in-out;
    position: absolute;
    margin-top: -10vh;
}

.seta-direita {
    right: -2.5vw;
}

.seta-esquerda {
    left: -2.5vw;
}

.seta-direita:hover,
.seta-esquerda:hover {
    color: #e8e8e8;
    transition: 300ms;
}

@media screen and (max-width:1000px) {

    .grid {
        margin-top: 3vh;
        height: 30vh;
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

    .row {
        height: 40vh;
        justify-content: unset;
        overflow-x: scroll;
        align-items: center;
    }

    .row-em-alta {
        height: 55vh;
        width: 90vw;
        justify-content: unset;
        padding: 1.4vw 0 1.4vw 3vh;
        box-sizing: border-box;
        overflow-x: scroll;
        gap: 5vw;
    }

    .conteiner-cards-em-alta {
        height: unset;
    }

    .row-em-alta::-webkit-scrollbar {
        height: 0;
    }

    .row::-webkit-scrollbar {
        height: 0;
    }

    .seta-direita,
    .seta-esquerda {
        display: none;
    }

}
</style>