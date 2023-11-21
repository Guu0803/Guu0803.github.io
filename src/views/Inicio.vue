<template>
    <div class="tela">
        <div class="conteiner-banner">
            <div class="conteiner-esquerdo">
                <div class="conteiner-titulo">
                    Filmes, séries, animes e
                    <div class="muito-mais">
                        MUITO MAIS!
                    </div>
                </div>
                <div class="descubra">
                    Descubra um universo de entretenimento ilimitado com nossa assinatura de streaming.
                    Junte-se à nossa comunidade apaixonada, experimente gratuitamente e desfrute de uma transmissão
                    impecável.
                </div>
                <div class="conteiner-botao">
                    <button v-on:click="mudarCriarConta()">
                        Inciar teste gratuito
                    </button>
                    <div>
                        Já e cadastrado?
                    </div>
                    <button v-on:click="mudarLogin()">
                        Faça Login
                    </button>
                </div>
            </div>
            <div class="banner">
            </div>
        </div>
        <div class="conteiner-planos">
            Confira nossos planos!
            <div class="planos">
                <planos plano="Mensal" preco="25,90" />
                <planos plano="Trimestral" descricao="Por R$ 21,99 / mês" preco="65,99" />
                <planos plano="Semestral" descricao="Por R$ 19,99 / mês" preco="119.99" />
                <planos plano="Anual" descricao="Por R$ 15,99 / mês" preco="191,99" />
            </div>
            <div class="info-planos">
                *todos os planos são renovados automaticamente, cancele quando quiser.
            </div>
            <div style="font-size: 3.5vh;">
                Incluso:
            </div>
            <div class="conteiner-descricao">
                <div class="descricao">
                    <div>
                        <span class="material-icons dots">
                            fiber_manual_record
                        </span>
                        Conteúdo em alta definição e qualidade 4K.
                    </div>
                    <div>
                        <span class="material-icons dots">
                            fiber_manual_record
                        </span>
                        Download das suas séries e filmes favoritos, <br>
                        assista onde e quando quiser.
                    </div>
                </div>
                <div class="descricao">
                    <div>
                        <span class="material-icons dots">
                            fiber_manual_record
                        </span>
                        Até 5 telas simultaneamente.
                    </div>
                    <div>
                        <span class="material-icons dots">
                            fiber_manual_record
                        </span>
                        Crie até 5 perfis diferentes.
                    </div>
                </div>
            </div>
        </div>
        <div class="conteiner-banner-secundario">
            <div class="banner-secundario">
            </div>
            <div class="descricao-banner-secundario">
                <div class="titulo-banner-secundario">
                    Não perca tempo e junte-se a nós
                    <div style="color:#f64348 ;">
                        AGORA MESMO!
                    </div>
                </div>
                E comece a explorar um universo infinito de filmes e séries,
                mergulhe em histórias envolventes e desfrute de momentos inesquecíveis de entretenimento.
            </div>
        </div>
    </div>
</template>

<script>
import planos from '@/components/cardPlanos.vue';
export default {
    name: "paginaIncial",
    components: {
        planos
    },
    methods: {
        mudarLogin(){
            this.$router.push('/login')
        },
        mudarCriarConta(){
            this.$router.push('/cadastro')
        }
    }
}
</script>

<style scoped>
.tela {
    width: 100%;
    height: fit-content;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 4vw;
    padding-top: 4vw;
}

.conteiner-banner {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 5vw;
}

.conteiner-esquerdo {
    display: flex;
    flex-direction: column;
    gap: 3vw;
    align-items: center;
    z-index: 1;
    max-width: 43vw;
    text-align: center;
}
.conteiner-titulo {
    color: #e8e8e8;
    font-size: 5vh;
    gap: 1vw;
}

.muito-mais {
    color: #f64348;
}

.descubra {
    font-size: 3vh;
    color: #e8e8e8;
}

.conteiner-botao {
    display: flex;
    flex-direction: column;
    gap: 1vw;
    align-items: center;
    color: #e8e8e8;
    font-size: 2vh;
}

button {
    font-size: 3vh;
    background-color: #f64348;
    border-radius: 10px;
    padding: 2vh;
    cursor: pointer;
    width: fit-content;
    font-weight: bold;
    color: #282828;
    transition: 200ms ease-in-out;
    border: none;
    font-family: 'Karla', sans-serif;
    user-select: none;
}

button:hover {
    color: #e8e8e8;
    transition: 200ms ease-in-out;
}

.banner {
    width: 60vw;
    height: 37vw;
    background-size: cover;
    box-shadow: 60px 50px 40px #1f1f1f inset, -10px -10px 25px 25px #1f1f1f inset;
    background-image: url("https://www.otempo.com.br/image/contentid/policy:1.2867942:1683905044/image-The-Witcher-3-temporada-e-quando-tudo-muda-na-serie.jpg?f=3x2&w=1224");
    margin-left: -10vw;
}
.banner-secundario {
    background-image: url("https://proxy.olhardigital.com.br/wp-content/uploads/2021/04/Demon-Slayer.png");
    background-size: contain;
    width:57vw;
    height: 60vh;
    margin-left: 4vh;
    box-shadow: 1vw 1vw 2vw 2vw #1f1f1f inset, -55px -50px 50px #1f1f1f inset;
}
.conteiner-banner-secundario {
    display: flex;
    align-items: center;
}
.titulo-banner-secundario {
    font-size: 4.4vh;
    display: flex;
    gap: 1vh;
    margin-bottom: 2vw;
}
.descricao-banner-secundario{
    color: #e8e8e8;
    z-index: 1;
    max-width: 48vw;
    text-align: center;
    font-size: 3vh;
    margin-left: -2vw;
}
.conteiner-planos {
    width: 100%;
    text-align: center;
    color: #e8e8e8;
    font-size: 5vh;
    display: flex;
    flex-direction: column;
    gap: 2vw;
    background-image: linear-gradient(to bottom, #181818, #1b1b1b);
    padding: 2vw 0;
}

.planos {
    display: flex;
    justify-content: center;
    gap: 4vw;
    margin-top: 3vw;
}

.info-planos {
    font-size: 2vh;
}

.conteiner-descricao {
    display: flex;
    font-size: 2.5vh;
    justify-content: center;
    align-items: flex-start;
    gap: 10vw;
}

.dots {
    font-size: 2vh;
    color: #f64348;
}

.descricao {
    display: flex;
    flex-direction: column;
    gap: 1vw;
}




@media screen and (max-width:1000px){
    .tela{
        padding: 2vw;
        box-sizing: border-box;
    }
    .conteiner-banner{
        flex-direction: column;
        width: 100%;
        margin-top: 5vh;
    }
    .conteiner-esquerdo{
        max-width: unset;
        text-align: unset;
    }
    .conteiner-titulo{
        flex-direction: column;
        font-size: 2.3em;
        text-align: center;
    }
    .muito-mais{
        font-size: 1em;
    }
    .descubra{
        font-size: 1.3em;
        text-align: center;
    }
    .conteiner-botao{
        gap: 2vh;
        margin-top: 2vh;
    }
    button {
        font-size: 1.3em;
        padding: 1.5vh;
    }
   
    .banner {
        width: 100%;
        height: 25vh;
        margin-left: 0;
        box-shadow: 10px 15px 10px #1f1f1f inset, -10px -10px 25px 15px #1f1f1f inset;
    }
    .conteiner-planos{
        font-size: 2em;
        margin-bottom: 3vh;
        gap: 5vh;
        border-radius: 10px;
        padding: 2vw;
        box-sizing: border-box;
    }
    .planos{
        flex-direction: column;
        align-items: center;
        gap: 7vh;
    }
    .info-planos{
        margin: 3vh 0;
    }
    .conteiner-descricao {
        margin-top: 2vh;
        flex-direction: column;
        align-items: unset;
        gap: 1vh;
    }
    .descricao {
        text-align: left;
        font-size: 0.8em;
        gap: 1vh;
    }
    .descricao  div {
        display: flex;
        align-items: flex-start;
        gap: 1vw;
    }
    .conteiner-banner-secundario{
        flex-direction: column;
        width: 100%;
        align-items: unset;
    }
    .banner-secundario{
        width: 100%;
        height: 29vh;
        margin: 0;
        box-shadow: 1vw 1vw 2vw 2vw #1f1f1f inset, -35px -30px 50px #1f1f1f inset;
    }
    .titulo-banner-secundario{
        font-size: 1em;
        flex-direction: column;
        width: 100%;
        margin: 3vh 0;
        text-align: center;
    }
    .descricao-banner-secundario{
        max-width: unset;
        font-size: 1.4em;
        text-align: center;
        padding: 2vw;
        box-sizing: border-box;
        margin-bottom: 5vh;
    }
}
</style>