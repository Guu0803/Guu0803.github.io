<template>
    <div :class="background()" :style="planoDeFundo()" v-on:click="salvar()">
        <div class="conteiner-recomendacao">
            <div class="descricao-recomendacao">
                <div class="titulo-recomendacao">
                    {{ nome }}
                </div>
                {{ resumoSinopse }}
                <div class="categorias">
                    <div>
                        {{ categoria1 }}
                    </div>
                    <span class="material-icons dot">
                        fiber_manual_record
                    </span>
                    <div>
                        {{ categoria2 }}
                    </div>
                    <span class="material-icons dot" v-if=this.categoria3>
                        fiber_manual_record
                    </span>
                    <div>
                        {{ categoria3 }}
                    </div>
                </div>
            </div>
            <img :src="imagemBanner" class="card">
        </div>
    </div>
</template>
<script>
export default {
    name: "cardLancamentosComponent",
    props: ["imagem", "imagemBanner", "imagemBannerFundo", "nome", "resumoSinopse", "nota", "scale", "categoria1", "categoria2", "categoria3", "sinopseCompleta", "duracaoFilme", "faixaEtaria", "wallpaper", "iconeRetirarDaLista", "adicionadoNaLista", "download", "tipoDoTitulo", 'atualizarPagina', 'trailer', 'roteiro', 'direcao', 'elenco', 'thumbnail', 'home', 'attPagina'],
    methods: {
        planoDeFundo() {
            return "background-image: url(" + this.imagemBannerFundo + ");"
        },
        background() {
            return 'background-style'
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
.card {
    width: 45vw;
    height: 50vh;
    border-radius: 10px;
    background-size: cover;
    cursor: pointer;
    box-shadow: 1.5vh 1.5vh 2vh black, -0.5vh -0.5vh 2vh #343434;
}

.background-style {
    width: 100%;
    height: 70vh;
    background-size: cover;
    border-radius: 10px;
    margin-bottom: 2vw;
    box-shadow: 1.5vh 1.5vh 2vh black, -0.5vh -0.5vh 2vh #343434;
    cursor: pointer;
}

.conteiner-recomendacao {
    display: flex;
    align-items: center;
    justify-content: space-around;
    background-image: linear-gradient(to right, #1f1f1f60, rgba(18, 18, 18, 0.60), rgba(5, 5, 5, 0.97));
    border-radius: 10px;
    height: 100%;
    padding: 1vh;
    box-sizing: border-box;
}

.descricao-recomendacao {
    text-align: left;
    font-size: 2.7vh;
    max-width: 35vw;
    color: #e8e8e8;
}

.titulo-recomendacao {
    font-size: 5vh;
    font-weight: 600;
    margin-bottom: 2vw;
}

.categorias {
    display: flex;
    align-items: center;
    font-size: 2vh;
    margin-top: 2vh;
    gap: 1vw;
}

.dot {
    font-size: 1.5vh;
}


@media screen and (max-width: 1000px) {
    .background-style {
        height: 30vh;
        
    }
    .descricao-recomendacao{
        max-width: unset;
        font-size: 2vh;
        text-align: center;
    }
    .titulo-recomendacao{
        font-size: 3vh;
        text-align: center;
    }
    .card {
       display: none;
    }
    .categorias{
        justify-content: center;
    }
    .dot {
        font-size: 0.5em;
        padding-top:2px ;
    }
}
</style>