<template>
    <div style="text-align: center;">
        <div class="conteiner-big-cards" v-on:click="salvar()">
            <img :src="imagem" class="big-card">
        </div>
        <div class="nome">
            {{ nome }}
        </div>
    </div>
</template>
<script>
export default {
    name: "cardsComponents",
    props: ["imagem", "nome", "sinopse", "resumoSinopse", "nota", "scale", "categoria1", "categoria2", "categoria3", "sinopseCompleta", "duracaoFilme", "faixaEtaria", "wallpaper", "iconeRetirarDaLista", "adicionadoNaLista", "download", "tipoDoTitulo", 'atualizarPagina', 'trailer', 'roteiro', 'direcao', 'elenco', 'thumbnail', 'home', 'attPagina'],
    data() {
        return {
            minhaLista: []
        }
    },
    methods: {
        salvar() {
            if (this.attPagina == true) {
                window.location.reload();
                window.scrollTo(0, 0)
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
                    thumbnail: this.thumbnail
                }
                informarcoes = JSON.stringify(informarcoes)
                localStorage.setItem("info", informarcoes)
                this.$router.push("/detalhe-titulo")
            } else {
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
                    thumbnail: this.thumbnail
                }
                informarcoes = JSON.stringify(informarcoes)
                localStorage.setItem("info", informarcoes)
                this.$router.push("/detalhe-titulo")
            }
        },
        retirarLista() {
            let lista = localStorage.getItem('MinhaLista')
            lista = JSON.parse(lista)
            if (lista) {
                this.minhaLista = lista
            }
            this.minhaLista = this.minhaLista.filter(this.remover)
            localStorage.setItem('MinhaLista', JSON.stringify(this.minhaLista))
            this.atualizarPagina()
        },
        remover(value) {
            if (value.nome != this.nome) {
                return value
            }
        },
        removerDownload() {
            let lista = localStorage.getItem('MeusDownloads')
            lista = JSON.parse(lista)
            if (lista) {
                this.minhaLista = lista
            }
            this.minhaLista = this.minhaLista.filter(this.excluirDownload)
            localStorage.setItem('MeusDownloads', JSON.stringify(this.minhaLista))
            this.atualizarPagina()
        },
        excluirDownload(value) {
            if (value.nome != this.nome) {
                return value
            }
        }
    },
    
}

</script>
<style scoped>
.conteiner-big-cards {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 1vh;
    width: 25vw;
    transition: 300ms ease-in-out;
    height: 75vh;
}

.nome {
    height: 6vh;
    margin-top: 1vh;
    font-size: 3vh;
    color: #e8e8e8;
}

.big-card {
    height: 65vh;
    width: 25vw;
    border-radius: 10px;
    box-shadow: 1.5vh 1.5vh 2vh black, -0.5vh -0.5vh 2vh #343434;
    cursor: pointer;
    transition: 300ms;
}

.conteiner-big-cards:hover {
    scale: 1.1;
    transition: 300ms ease-in-out;
}

.conteiner-big-cards:hover div {
    color: #f64348;
    transition: 300ms ease-in-out;
}




@media screen and (max-width:1000px) {

    .conteiner-big-cards {
        height: 45vh;
        width: 55vw;
        gap: 5vw;
    }

    .big-card {
        height: 45vh;
        width: 55vw;
    }

    .nome {
        font-size: 1em;
        color: #e8e8e8;
        margin-top: 2vh;

    }

}
</style>