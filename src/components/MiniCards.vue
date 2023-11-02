<template>
    <div class="conteiner-card" v-on:click="salvar()" :class="checarScale()">
        <div class="div-teste">
            <!-- :class metodo que esta verificando na pagina inicial se é verdadeiro ou não a condição e retornando uma classe -->
            <img :src="imagem" class="card" >
            <!-- Fim -->
            <div v-if="sinopse == true" class="teste">
                <div class="classificacao">
                    {{ nota }}
                    <span class="material-icons estrela">
                        star_rate
                    </span>
                </div>
                <div class="categoria-conteiner">
                    <div class="categoria">
                        {{ categoria1 }}
                    </div>
                    <span class="material-icons dot">
                        fiber_manual_record
                    </span>
                    <div class="categoria">
                        {{ categoria2 }}
                    </div>
                    <span class="material-icons dot" v-if="categoria3">
                        fiber_manual_record
                    </span>
                    <div class="categoria">
                        {{ categoria3 }}
                    </div>
                </div>
                {{ resumoSinopse }}
            </div>
            <div class="tirar-da-lista" v-if="this.iconeRetirarDaLista == true">
                <span class="material-icons" v-on:click.stop="retirarLista()">
                    playlist_remove
                </span>
            </div>
            <div class="tirar-da-lista" v-if="this.download == true">
                <span class="material-icons" v-on:click.stop="removerDownload()">
                    <span class="material-icons">
                        delete_forever
                    </span>
                </span>
            </div>
        </div>
        <div class="info-card">
            {{ nome }}
        </div>
    </div>
</template>
<script>
export default {
    name: "miniCardsComponent",
    props: ["imagem", "nome", "sinopse", "resumoSinopse", "nota", "scale", "categoria1", "categoria2", "categoria3", "sinopseCompleta", "duracaoFilme", "faixaEtaria", "wallpaper", "iconeRetirarDaLista", "adicionadoNaLista", "download", "tipoDoTitulo", 'atualizarPagina', 'trailer', 'roteiro', 'direcao', 'elenco', 'thumbnail', 'home', 'attPagina'],
    data() {
        return {
            minhaLista: []
        }
    },
    methods: {
        checarScale() {
            if (this.scale == true) {
                return "card-scale"
            }
        },
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
            let user = localStorage.getItem('usuarioLogado')
            user= JSON.parse(user)
            user.minhaLista = user.minhaLista.filter(this.remover)
            localStorage.setItem('usuarioLogado', JSON.stringify(user))
            this.atualizarPagina()
        },
        remover(value) {
            if (value.nome != this.nome) {
                return value
            }
        },
        removerDownload() {
            let user = localStorage.getItem('usuarioLogado')
            user= JSON.parse(user)
            user.meusDownloads = user.meusDownloads.filter(this.remover)
            localStorage.setItem('usuarioLogado', JSON.stringify(user))
            this.atualizarPagina()
        },
        excluirDownload(value) {
            if (value.nome != this.nome) {
                return value
            }
        }
    }
}
</script>
<style scoped>
.conteiner-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 51vh;
    transition: 300ms ease-in-out;
}

.div-teste {
    position: relative;
}

.card {
    height: 40vh;
    width: 14vw;
    border-radius: 10px;
    box-shadow: 1.5vh 1.5vh 1.5vh black, -0.5vh -0.5vh 1vh #343434;
    cursor: pointer;
    transition: 300ms ease-in-out;

}

.card-scale:hover {
    scale: 1.1;
    transition: 300ms ease-in-out;
}

.info-card {
    text-align: center;
    margin-top: 1vh;
    color: #e8e8e8;
    cursor: pointer;
    max-width: 14vw;
    transition: 300ms ease-in-out;
    font-weight: 500;
    font-size: 2.5vh;
}

.info-card:hover {
    color: #f64348;
    transition: 300ms;
}

.teste {
    visibility: hidden;
    transition: 100ms ease-in-out;
    display: flex;
    text-align: center;
    padding: 10% 0;
    flex-direction: column;
    position: absolute;
    background-color: rgba(0, 0, 0, 0.8);
    top: 0;
    height: 85%;
    width: 100%;
    border-radius: 10px;
    color: #e8e8e8;
    cursor: pointer;
    font-size: 2vh;
}

.div-teste:hover>.teste {
    visibility: visible;
    transition: 100ms ease-in-out;
}

.div-teste:hover~.info-card {
    color: #f64348;
    transition: 100ms ease-in-out;
}

.dot {
    font-size: 1.5vh;
    color: #B2B2B2;
}

.categoria-conteiner {
    display: flex;
    color: #B2B2B2;
    align-items: center;
    justify-content: center;
    gap: 0.5vh;
    margin: 2vh 0;
}

.categoria:hover {
    color: #f64348;
}

.classificacao {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 1vh 0;
}

.estrela {
    color: #DAA520;
    font-size: 3vh;
}

.tirar-da-lista {
    position: absolute;
    top: 1vh;
    right: 1vh;
    cursor: pointer;
    visibility: hidden;
    width: 4vh;
    height: 4vh;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
}

.tirar-da-lista:hover {
    background-color: #353535;

}

.div-teste:hover>.tirar-da-lista {
    visibility: visible;
}



@media screen and (max-width:1000px) {
    .conteiner-card{
        width: 44vw;
        display: flex;
        height: 42vh;
        padding: 2vw 0;
        box-sizing: border-box;
        


    }
    .card{
        width: 40vw;
        height: 32vh;
    }
    .teste{
        display: none;
    }
    .info-card{
        width:90%;
        max-width: unset;
        font-size: 2.2vh;
    }
    .tirar-da-lista{
        visibility: visible;
    }
}
</style>



