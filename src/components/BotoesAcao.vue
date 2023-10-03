<template>
    <div class="botaoConteiner">
        <div class="botaoAcao">
            {{ text }}
        </div>
    </div>
</template>
<script>
export default {
    name: "BotoesAcao",
    props: ["text"]

}
</script>
<style scoped>

.botaoConteiner {
    padding-bottom: 3vh;
    display: flex;
    justify-content: center;
}

.botaoAcao {
    font-size: large;
    border-radius: 2vh;
    padding: 1vh;
    width: 20vw;
    border: none;
    text-align: center;
    background-color:  #f64348;
    font-family: 'Karla', sans-serif;
    cursor: pointer;
    color: #282828;
    font-weight: bold;
    transition: 200ms ease-in-out;
    user-select: none;

}

.botaoAcao:hover {
    color: #e8e8e8;
    transition: 200ms ease-in-out;
}


@media screen and (max-width:1000px) {
    .botaoAcao{
        width: 50vw;
    }
}
</style>