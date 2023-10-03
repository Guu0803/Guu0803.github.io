<template>
    <div class="tela">
        <div class="conteiner-banner" :style="getImage()" v-on:click="salvar()">
            <div class="titulo-banner">
                {{ nome }}
            </div>
            <div class="conteiner-reproduzir">
                <div class="conteiner-icones">
                    <span class="material-icons botao-play">
                        play_arrow
                    </span>
                    Iniciar
                </div>
                <div class="conteiner-icones">
                    <span class="material-icons">
                        theaters
                    </span>
                    Trailer
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "banerComponent",
    props: ["imagem", "imagemBanner", "imagemBannerFundo", "nome", "resumoSinopse", "nota", "scale", "categoria1", "categoria2", "categoria3", "sinopseCompleta", "duracaoFilme", "faixaEtaria", "wallpaper", "iconeRetirarDaLista", "adicionadoNaLista", "download", "tipoDoTitulo", 'atualizarPagina', 'trailer', 'roteiro', 'direcao', 'elenco', 'thumbnail', 'home', 'attPagina'],
    data() {
        return {
            adicionarLista: false
        }
    },
    methods: {
        getImage() {
            return "background-image: url(" + this.imagemBanner + ")"
        },
        salvar() {
            let informarcoes = {
                nome: this.nome,
                imagem: this.imagem,
                resumoSinopse: this.resumoSinopse,
                sinopseCompleta: this.sinopseCompleta,
                duracaoFilme: this.duracaoFilme,
                faixaEtaria: this.faixaEtaria,
                nota: this.nota,
                wallpaper: this.wallpaper,
                categoria1: this.categoria1,
                categoria2: this.categoria2,
                categoria3: this.categoria3,
                download: this.download,
                adicionadoNaLista: this.adicionadoNaLista,
                tipoDoTitulo: this.tipoDoTitulo,
                trailer: this.trailer,
                roteiro: this.roteiro,
                direcao: this.direcao,
                elenco: this.elenco,
                thumbnail: this.thumbnail,

            }
            informarcoes = JSON.stringify(informarcoes)
            localStorage.setItem("info", informarcoes)
            this.$router.push("/detalhe-titulo")
        }
    }
}
</script>
<style scoped>
.conteiner-banner {
    border-radius: 10px;
    color: white;
    width: 95vw;
    height: 70vh;
    background-size: cover;
    cursor: pointer;
    position: relative;

}

.titulo-banner {
    position: absolute;
    bottom: 10vw;
    left: 5vw;
    font-size: 7vh;
    width: 40vw;
    text-transform: uppercase;
}

.conteiner-reproduzir {
    position: absolute;
    bottom: 8vw;
    left: 6vw;
    display: flex;
    align-items: center;
    gap: 1vw;
    font-size: 4vh;
}

.conteiner-icones {
    display: flex;
    align-items: center;
    gap: 1vh;
    cursor: pointer;
}

.conteiner-icones:hover {
    cursor: pointer;
    color: #f64348;
    transition: 300ms;
}



@media screen and (max-width:1000px) {
    .conteiner-banner {
        height: 30vh;
        background-size: cover;
        background-position: center;
        text-align: center;
    }

    .titulo-banner {
        font-size: 1.3em;
        bottom: 2vh;
        width: 100%;
        left: 0;
    }

    .conteiner-reproduzir {
        display: none;
    }
}
</style>