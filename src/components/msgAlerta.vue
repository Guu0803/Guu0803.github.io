<template>
    <div class="conteiner-card">
        <div class="card">
            Faça Login para continuar
            <button v-on:click="toLogin()">
                Continuar
            </button>
        </div>
    </div>
</template>
<script>
export default {
    name: 'msgComponent',
    methods:{
        toLogin(){
            this.$router.push('/login')
            document.body.style.overflow = 'auto'
        }
    }
}
</script>
<style scoped>
.conteiner-card{
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0,0,0, 0.5);
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
}
.card {
    background-color: #1f1f1f;
    color: #e8e8e8;
    font-size: 3vh;
    padding: 1vw;
    display: flex;
    flex-direction: column;
    border-radius: 10px;
}
button {
    font-size: 2.5vh;
    padding: 1.5vh;
    cursor: pointer;
    border-radius: 10px;
    border: none;
    background-color: #353535;
    color: #B2B2B2;
    font-weight: bold;
    transition: 300ms;
    margin-top: 2vw;
    font-family: 'Karla', sans-serif;
    user-select: none;

}

button:hover {
    background-color: #f64348;
    transition: 300ms;
    color: white;
}



@media screen and (max-width:1000px) {
    .card{
        padding: 2vh;
        font-size: 1.3em;
        gap: 1vh;
    }
    button{
        font-size: 1em;
        padding: 1vh;
    }
}
</style>
