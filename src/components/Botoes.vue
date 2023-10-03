<template>
    <div class="conjuntoBotoes">
        <button class="botao">
            Play
            <img src="@/components/IconesBotoes/play.png">
        </button>
        <button class="botao">
            Trailer
            <img src="@/components/IconesBotoes/play.png">
        </button>
        <button class="botao">
            Assistir depois
            <img src="@/components/IconesBotoes/soma.png">
        </button>
        <button class="botao">
            <img src="@/components/IconesBotoes/baixar.png">
        </button>
    </div>
</template>
<script>
export default {
    name: "botoesComponent"
}
</script>
<style scoped>
.conjuntoBotoes {
    margin: 3vh 0 0 7vw;
    gap: 3vh;
    display: flex;

}

.botao {
    background-color: rgba(241, 196, 15, 0.35);
    border-radius: 1vw;
    font-size: 3vh;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    padding: 1vh;
    border: #f1c40f 1px solid;
    display: flex;
    gap: 1vh;
    align-items: center;
    font-family: 'Karla', sans-serif;
    user-select: none;

}

.botao:hover {
    cursor: pointer;
    transition: 400ms;
    box-shadow: 0vh 0vh 1vh 1vh #ffffff99;
    background-color: rgba(241, 196, 15);
}
</style>