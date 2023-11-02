<template>
    <div class="tela" v-on:click="fecharTrailer()">
        <div class="banner" :style="getImage()">
            <span class="material-icons seta-voltar" v-on:click="voltar()">
                reply
            </span>
            <div class="titulo">
                {{ informacoes.nome }}
            </div>
            <div class="info">
                <div>
                    {{ informacoes.duracaoFilme }}
                </div>
                <div>
                    <img :src="informacoes.faixaEtaria">
                </div>
                <div>
                    Full HD
                </div>
            </div>
        </div>
        <div class="conteiner-reproduzir">
            <div class="conteiner-play">
                <span class="material-icons play">
                    play_arrow
                </span>
                Iniciar
                <div class="iniciar-primeiro-episodio"
                    v-if="informacoes.tipoDoTitulo == 'serie' || informacoes.tipoDoTitulo == 'anime'">
                    Ep.1
                </div>
            </div>
            <div class="conteiner-play" v-on:click.stop="trailerPlay()">
                <span class="material-icons trailer-conteiner">
                    movie
                </span>
                Trailer
            </div>
            <div class="conteiner-play" v-on:click="adicionarLista()">
                <span class="material-icons" v-if="adicionadoLista == false">
                    playlist_add
                </span>
                <span class="material-icons" v-if="adicionadoLista == true">
                    playlist_add_check
                </span>
                Lista
            </div>
            <div class="conteiner-play" v-on:click="baixar()">
                <span class="material-icons" v-if="baixado == false">
                    download
                </span>
                <span class="material-icons" v-if="baixado == true">
                    download_done
                </span>
                Baixar
            </div>
        </div>

        <div class="conteiner-informacoes" :class="ajustarConteinerParaFilmes()">
            <div class="aba-titulos">
                <div class="aba" v-on:click="mudarParaEpisodios()" :class="selecionarEpisodios()"
                    v-if="informacoes.tipoDoTitulo == 'serie' || informacoes.tipoDoTitulo == 'anime'">
                    Episódios
                </div>
                <div class="aba" v-on:click="mudarParaSinopse()" :class="selecionarSinopse()">
                    Sinopse
                </div>
                <div class="aba" v-on:click="mudarParaDetalhes()" :class="selecionarDetalhes()">
                    Detalhes
                </div>
            </div>
            <div class="sinopse" v-if="abaSelecionada == 'sinopse'">
                {{ informacoes.sinopseCompleta }}
            </div>

            <div class="detalhes" v-if="abaSelecionada == 'detalhes'">
                <div class="conteiner-info">
                    Direção:
                    <div class="infos">
                        {{ informacoes.direcao }}
                    </div>
                </div>
                <div class="conteiner-info">
                    Roteiro:
                    <div class="infos">
                        {{ informacoes.roteiro }}
                    </div>
                </div>
                <div class="conteiner-info">
                    Elenco:
                    <div class="infos">
                        {{ informacoes.elenco }}
                    </div>
                </div>
                <div class="conteiner-info">
                    Gênero:
                    <div class="infos">
                        {{ informacoes.categoria1 }}
                        <span class="material-icons dot" v-if="informacoes.categoria2">
                            fiber_manual_record
                        </span>
                        {{ informacoes.categoria2 }}
                        <span class="material-icons dot" v-if="informacoes.categoria3">
                            fiber_manual_record
                        </span>
                        {{ informacoes.categoria3 }}
                    </div>
                </div>
            </div>

            <div class="conteiner-episodios" v-if="abaSelecionada == 'episodios'">
                <details>
                    <summary>
                        Temporada 1
                        <span class="material-icons seta">
                            keyboard_arrow_down
                        </span>
                    </summary>
                    <p> Temporada 1 </p>
                    <p> Temporada 2 </p>
                    <p> Temporada 3 </p>
                    <p> Temporada 4 </p>
                    <p> Temporada 5 </p>
                    <p> Temporada 6 </p>
                </details>
                <div class="lista-de-episodios">
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 1
                        <div class="separacao"> </div>
                        Piloto
                    </div>
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 2
                        <div class="separacao"> </div>
                        Piloto
                    </div>
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 3
                        <div class="separacao"> </div>
                        Piloto
                    </div>
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 4
                        <div class="separacao"> </div>
                        Piloto
                    </div>
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 5
                        <div class="separacao"> </div>
                        Piloto
                    </div>
                    <div>
                        <div class="thumbnail">
                            <img :src=informacoes.thumbnail>
                        </div>
                        1 - 6
                        <div class="separacao"> </div>
                        Piloto
                    </div>

                </div>
            </div>
        </div>

        <div class="recomendacoes-conteiner">
            <div class="titulo-recomendacoes">
                Você pode gostar também:
            </div>
            <div class="recomendacoes" v-if="this.informacoes.tipoDoTitulo == 'filme'">
                <div v-for="filme in  recomendacaoFilmes" :key="filme.id" class="fileira-recomendacoes">
                    <miniCards :nome="filme.nome" :imagem="filme.imagem" :nota="filme.nota" :categoria1="filme.categoria1"
                        :categoria2="filme.categoria2" :categoria3="filme.categoria3" :resumoSinopse="filme.resumoSinopse"
                        :duracaoFilme="filme.duracaoFilme" :faixaEtaria="filme.faixaEtaria" :attPagina="true"
                        :tipoDoTitulo="filme.tipoDoTitulo" :sinopseCompleta="filme.sinopseCompleta"
                        :wallpaper="filme.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="recomendacoes" v-if="this.informacoes.tipoDoTitulo == 'serie'">
                <div v-for="serie in  recomendacaoSeries" :key="serie.id" class="fileira-recomendacoes">
                    <miniCards :nome="serie.nome" :imagem="serie.imagem" :nota="serie.nota" :categoria1="serie.categoria1"
                        :categoria2="serie.categoria2" :categoria3="serie.categoria3" :resumoSinopse="serie.resumoSinopse"
                        :duracaoFilme="serie.duracaoFilme" :faixaEtaria="serie.faixaEtaria" :attPagina="true"
                        :tipoDoTitulo="serie.tipoDoTitulo" :sinopseCompleta="serie.sinopseCompleta"
                        :thumbnail="serie.thumbnail" :wallpaper="serie.wallpaper" :sinopse="true" />
                </div>
            </div>
            <div class="recomendacoes" v-if="this.informacoes.tipoDoTitulo == 'anime'">
                <div v-for="anime in  recomendacaoAnimes" :key="anime.id" class="fileira-recomendacoes">
                    <miniCards :nome="anime.nome" :imagem="anime.imagem" :nota="anime.nota" :categoria1="anime.categoria1"
                        :categoria2="anime.categoria2" :categoria3="anime.categoria3" :resumoSinopse="anime.resumoSinopse"
                        :duracaoFilme="anime.duracaoFilme" :faixaEtaria="anime.faixaEtaria" :attPagina="true"
                        :tipoDoTitulo="anime.tipoDoTitulo" :sinopseCompleta="anime.sinopseCompleta"
                        :thumbnail="anime.thumbnail" :wallpaper="anime.wallpaper" :sinopse="true" />
                </div>
            </div>
        </div>
        <div class="trailer" v-if="trailerON">
            <span class="material-icons fechar" v-on:click="fecharTrailer()">
                close
            </span>
                <iframe  width="100%" height="80%" :src=informacoes.trailer :title=informacoes.nome
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen>
                </iframe>
        </div>

        <alerta v-if="aviso == true" />

    </div>
</template>
<script>
import miniCards from '@/components/MiniCards.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: "detalheTitulo",
    components: {
        miniCards,
        alerta
    },
    data() {
        return {
            informacoes: {},
            baixado: false,
            adicionadoLista: false,
            nomeDoTitulo: '',
            recomendacaoSeries: [],
            recomendacaoAnimes: [],
            recomendacaoFilmes: [],
            trailerON: false,
            abaSelecionada: '',
            aviso: false,
            usuario: {}
        }
    },
    methods: {
        getImage() {
            return "background-image: url(" + this.informacoes.wallpaper + ")"
        },
        voltar() {
            this.$router.go(-1)
        },
        adicionarLista() {
            if (this.adicionadoLista == false) {
                if (this.usuario.minhaLista.length == 0) {
                    this.adicionadoLista = true
                    let minhaLista = []
                    minhaLista.push(this.informacoes)
                    this.usuario.minhaLista = minhaLista
                    localStorage.setItem("usuarioLogado", JSON.stringify(this.usuario))
                } else {
                    for (let index = 0; index < this.usuario.minhaLista.length; index++) {
                        const element = this.usuario.minhaLista[index];
                        if (this.informacoes.nome != element.nome) {
                            this.adicionadoLista = true
                            this.usuario.minhaLista.push(this.informacoes)
                            localStorage.setItem("usuarioLogado", JSON.stringify(this.usuario))
                            break
                        }
                    }
                }
            } else {
                this.usuario.minhaLista = this.usuario.minhaLista.filter(this.removerLista)
                localStorage.setItem("usuarioLogado", JSON.stringify(this.usuario))
                this.adicionadoLista = false
            }
        },
        removerLista(value) {
            if (value.nome != this.informacoes.nome) {
                return value
            }
        },
        baixar() {
            if (this.baixado == false) {
                if (this.usuario.meusDownloads.length == 0) {
                    this.baixado = true
                    let downloads = []
                    downloads.push(this.informacoes)
                    this.usuario.meusDownloads = downloads
                    localStorage.setItem("usuarioLogado", JSON.stringify(this.usuario))
                } else {
                    for (let index = 0; index < this.usuario.meusDownloads.length; index++) {
                        const element = this.usuario.meusDownloads[index];
                        if (this.informacoes.nome != element.nome) {
                            this.baixado = true
                            this.usuario.meusDownloads.push(this.informacoes)
                            localStorage.setItem('usuarioLogado', JSON.stringify(this.usuario))
                            break
                        }
                    }
                }
            } else {
                this.usuario.meusDownloads = this.usuario.meusDownloads.filter(this.removerDownloads)
                localStorage.setItem('usuarioLogado', JSON.stringify(this.usuario))
                this.baixado = false
            }
        },
        removerDownloads(value) {
            if (value.nome != this.informacoes.nome) {
                return value
            }
        },
        trailerPlay() {
            this.trailerON = true
            window.scrollTo(0, 0);
        },
        fecharTrailer() {
            this.trailerON = false
        },
        mudarParaDetalhes() {
            this.abaSelecionada = 'detalhes'

        },
        mudarParaSinopse() {
            this.abaSelecionada = 'sinopse'
        },
        mudarParaEpisodios() {
            this.abaSelecionada = 'episodios'
        },
        selecionarDetalhes() {
            if (this.abaSelecionada == 'detalhes') {
                return "aba-selecionada"
            }
        },
        selecionarSinopse() {
            if (this.abaSelecionada == 'sinopse') {
                return "aba-selecionada"
            }
        },
        selecionarEpisodios() {
            if (this.abaSelecionada == 'episodios') {
                return "aba-selecionada"
            }
        },
        ajustarConteinerParaFilmes() {
            if (this.informacoes.tipoDoTitulo == 'filme') {
                return "conteiner-informacoes-filmes"
            }
        }
    },
    created() {
        let usuario = localStorage.getItem('usuarioLogado')
        if (usuario) {
            this.usuario = JSON.parse(usuario)
            if (!this.usuario.minhaLista) {
                this.usuario.minhaLista = []
            }
            if (!this.usuario.meusDownloads) {
                this.usuario.meusDownloads = []
            }
        }
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
        let informacoesSalva = localStorage.getItem("info")
        informacoesSalva = JSON.parse(informacoesSalva)
        this.informacoes = informacoesSalva
        if (this.informacoes.tipoDoTitulo == 'serie' || this.informacoes.tipoDoTitulo == 'anime') {
            this.abaSelecionada = 'episodios'
        } else {
            this.abaSelecionada = 'sinopse'
        }

        let listaSalva = localStorage.getItem('usuarioLogado')
        listaSalva = JSON.parse(listaSalva)
        if (listaSalva.minhaLista) {
            this.usuario = listaSalva
            for (let index = 0; index < this.usuario.minhaLista.length; index++) {
                const element = this.usuario.minhaLista[index];
                if (this.informacoes.nome == element.nome) {
                    this.adicionadoLista = true
                }
            }
        }
        let download = localStorage.getItem('usuarioLogado')
        download = JSON.parse(download)
        if (download.meusDownloads) {
            this.usuario = download
            for (let index = 0; index < this.usuario.meusDownloads.length; index++) {
                const element = this.usuario.meusDownloads[index];
                if (this.informacoes.nome == element.nome) {
                    this.baixado = true
                }
            }
        }
        window.scrollTo(0, 0);

        let recomendacaoAnime = this.$store.state.listaDeAnimes
        recomendacaoAnime.forEach(element => {
            if (element.tipoDoTitulo == this.informacoes.tipoDoTitulo) {
                if (element.categoria1 == this.informacoes.categoria1 && element.nome != this.informacoes.nome) {
                    this.recomendacaoAnimes.push(element)
                }
            }
        });

        let recomendacaoFilmes = this.$store.state.listaDeFilmes
        recomendacaoFilmes.forEach(element => {
            if (element.tipoDoTitulo == this.informacoes.tipoDoTitulo) {
                if (element.categoria1 == this.informacoes.categoria1 && element.nome != this.informacoes.nome) {
                    this.recomendacaoFilmes.push(element)
                }
            }
        });

        let recomendacaoSeries = this.$store.state.listaDeSeries
        recomendacaoSeries.forEach(element => {
            if (element.tipoDoTitulo == this.informacoes.tipoDoTitulo) {
                if (element.categoria1 == this.informacoes.categoria1 && element.nome != this.informacoes.nome) {
                    this.recomendacaoSeries.push(element)
                }
            }
        });
    }
}
</script>
<style scoped>
.tela {
    width: 100%;
    position: relative;
}

.trailer {
    position: fixed;
    width: 100%;
    height: 100%;
    z-index: 3;
    top: 0;
    background-color: rgba(0, 0, 0, 0.7);
    text-align: end;
}

.fechar {
    margin: 0 1vw -1vw 0;
    color: #f64348;
    cursor: pointer;
    padding: 1vh;
    border-radius: 50%;
}

.fechar:hover {
    background-color: rgba(0, 0, 0, 0.7);
    transition: ease-in-out;
}

.banner {
    height: 90vh;
    background-size: cover;
    color: #e8e8e8;
    box-shadow: inset 10px -120px 40px #1f1f1f, inset -10px -70px 40px #1f1f1f;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    position: relative;
}

.seta-voltar {
    position: absolute;
    top: 0;
    left: 1vw;
    font-size: 7vh;
    cursor: pointer;
    transition: 200ms;
}

.seta-voltar:hover {
    color: #1f1f1f80;
    transition: 200ms;
}

.titulo {
    font-size: 6vh;
    position: absolute;
    bottom: 3vw;
    left: 9vw;
    text-transform: uppercase;
    font-weight: bold;

}

.info {
    display: flex;
    align-items: center;
    gap: 2vw;
    width: fit-content;
    position: absolute;
    bottom: 0;
    left: 9vw;
    font-size: 2.5vh;
}

.conteiner-reproduzir {
    display: flex;
    width: fit-content;
    color: #e8e8e8;
    margin-left: 8.2vw;
    font-size: 4vh;
    gap: 2vw;
}

.iniciar-primeiro-episodio {
    font-size: 3vh;
    margin-left: 0.5vw;
}

.conteiner-play {
    display: flex;
    align-items: center;
    gap: 1vh;
}

.conteiner-play:hover {
    color: #f64348;
    cursor: pointer;
}

.play {
    font-size: 5vh;
}

.conteiner-informacoes {
    margin: 3vh 0 0 9vw;
    height: 49.5vh;
    width: 70%;
}

.conteiner-informacoes-filmes {
    margin: 3vh 0 0 9vw;
    height: 22vh;
    width: 70%;
}

.aba-titulos {
    display: flex;
    color: #bfbfbf;
    font-size: 3vh;
    gap: 1vh;
    margin-left: 1vw;
    font-weight: bold;

}

.aba {
    padding: 0.5vh 1vw;
    border-radius: 20px 20px 0 0;
    cursor: pointer;
    transition: 200ms ease-in-out;
    border-bottom: 2px solid #1f1f1f;

}

.aba:hover {
    color: #e8e8e8;
    transition: 200ms ease-in-out;

}

.aba-selecionada {
    color: #e8e8e8;
    border-color: #e8e8e8;
    padding: 0.5vh 1vw;
    border-radius: 20px 20px 0 0;
    cursor: pointer;
}

.conteiner-episodios {
    height: 49.5vh;
    overflow: scroll;
    overflow-x: hidden;
    background-color: #121212;
    position: relative;

}

details {
    color: #e8e8e8;
    font-weight: bold;
    font-family: 'Karla', sans-serif;
    font-size: 3vh;
    width: fit-content;
    cursor: pointer;
    margin: 1vw;
    text-align: center;
    background-color: #121212;
    border: 1px solid #1f1f1f;
    position: absolute;
}

details>summary {
    display: flex;
    gap: 1vh;
    padding: 1vh;
    background-color: #121212;
    border-radius: 10px;
}

summary {
    margin-bottom: 0;
}

p {
    margin: 0;
}

details>p {
    color: #e8e8e8;
    padding: 1vh;
}

details>p:hover {
    background-color: #f64348;
}

.lista-de-episodios {
    display: flex;
    flex-direction: column;
    color: #e8e8e8;
    font-size: 3vh;
    margin-top: 9vh;
}

.lista-de-episodios div:not(.thumbnail, .separacao) {
    padding: 1vh 1vw;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 1vw;
    height: 8vh;
    border-bottom: #1f1f1f 1px solid;
    transition: 200ms ease-in-out;

}

.separacao {
    border: #1f1f1f 1px solid;
    border-radius: 10px;
    height: 5vh;
}

.lista-de-episodios div:hover {
    background-color: #f64348;
    transition: 200ms ease-in-out;
}

.thumbnail {
    width: auto;
    height: 100%;
}

img {
    height: 100%;
    border-radius: 10px;
}

.sinopse {
    color: #e8e8e8;
    font-size: 3vh;
    text-align: justify;
    padding: 1vh;
    border-radius: 10px;
    height: 15vh;

}

.detalhes {
    font-size: 3vh;
    padding: 1vh;
    display: flex;
    flex-direction: column;
    gap: 0.5vh;
    width: 70%;
    border-radius: 10px;
    height: 15vh;
}

.conteiner-info {
    display: flex;
    align-items: center;
    gap: 1vw;
    color: #e8e8e8;
    font-weight: bold;
}

.infos {
    color: #bfbfbf;
    font-size: 2.7vh;
    display: flex;
    align-items: center;
    gap: 1vh;
    font-weight: lighter;
}

.dot {
    font-size: 1vh;
    margin-top: 0.5vh;
}

.recomendacoes-conteiner {
    color: #e8e8e8;
    font-weight: bold;
    display: flex;
    font-size: 3vh;
    flex-direction: column;
    gap: 2vw;
    padding: 1vh;
    margin: 7vh 0 5vh 9vw;
}

.recomendacoes {
    display: flex;
    gap: 2vw;
}

@media screen and (max-width:1000px) {
    .banner {
        height: 35vh;
        box-shadow: inset 10px 5px 40px #1f1f1f, inset -10px -70px 40px #1f1f1f;
    }

    .trailer {
        height: 100vh;
        width: 99%;
    }

    .fechar {
        margin: 0;
    }

    .tela {
        padding: 1vw;
        box-sizing: border-box;
    }

    .seta-voltar {
        display: none;
    }

    .titulo {
        font-size: 1.6em;
        bottom: 3vh;
        left: 4vw;

    }

    .info {
        font-size: 0.8em;
        margin-left: -5vw;
        bottom: -2vh;
    }

    .conteiner-reproduzir {
        font-size: 1em;
        margin: 2vh 0 0 1vw;
    }

    .iniciar-primeiro-episodio {
        font-size: 1em;

    }

    .conteiner-play {
        gap: 1vw;
    }

    .play {
        margin-right: -1vw;
    }

    .conteiner-informacoes {
        width: 95%;
        margin: 1vh 0 0 3vw;
        box-sizing: border-box;
        margin-bottom: 4vh;
    }

    .conteiner-episodios {
        height: 47vh;
    }

    .aba-titulos {
        font-size: 1.1em;
    }

    details {
        font-size: 1em;
    }

    .lista-de-episodios {
        font-size: 1em;
        margin-top: 7vh;
    }

    .sinopse {
        font-size: 0.9em;
    }

    .detalhes {
        font-size: 0.9em;
        width: 100%;
    }

    .infos {
        font-size: 0.9em;
    }

    .recomendacoes-conteiner {
        margin: 3vh 0 5vh 0;
        font-size: 1.2em;
        padding: 0;
        box-sizing: border-box;
    }

    .titulo-recomendacoes {
        margin-left: 4vw;
    }

    .recomendacoes {
        flex-wrap: nowrap;
        overflow-x: scroll;
    }

    .recomendacoes::-webkit-scrollbar {
        height: 0;
    }
}
</style>