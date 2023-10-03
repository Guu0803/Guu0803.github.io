<template>
    <div class="card">
        <div>
            {{ plano }}
        </div>
        <div class="descricao">
            {{ descricao }}
        </div>
        <div class="preco">
           R$ {{preco}}
        </div>
        <button v-on:click="toPlanos()">
            Assinar
        </button>
    </div>
</template>
<script>
export default {
    name:"cardPlanos",
    props: ["plano", "preco", "descricao"],
    methods:{
        toPlanos(){
            let planos = {
                nome: this.plano,
                preco:this.preco
            }
            localStorage.setItem('plano', JSON.stringify(planos))
            this.$router.push('/cadastro')
        }
    }
}
</script>
<style scoped>
.card {
    width: 15vw;
    height: 40vh;
    padding: 1vh;
    display: flex;
    flex-direction: column;
    gap: 5vh;
    font-size: 4vh;
    color: #e8e8e8;
    justify-content: center;
    align-items: center;
    background-image: linear-gradient(to bottom, #f64348, #181818 );
    border-radius: 10px;
}
.preco {
    color: #e8e8e8;
}
.descricao {
    font-size: 2.5vh;
    color: #e8e8e8;
    min-height: 5vh;
}
button {
    font-size: 2.5vh;
    background-color: #B2B2B2;
    border-radius: 10px;
    padding: 1vh;
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
    background-color: #f64348;
    transition: 200ms ease-in-out;
}
@media screen and (max-width:1000px) {
    .card{
    width: 60%;
    height: 35vh;
    }
    button {
        width: 35vw;
    }
}
</style>