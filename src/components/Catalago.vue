<template>
    <div class="card">
        {{ texto }}
    </div>
</template>
<script>
export default {
    name: "cardCatalogo",
    props: ["texto"]
}
</script>
<style scoped>
.card {
    width: 15vw;
    height: 20vh;
    color: black;
    background: rgb(231, 4, 10);
    background: linear-gradient(151deg, rgba(231, 4, 11, 0.767) 42%, rgba(44, 44, 44, 1) 95%);
    border-radius: 10px;
    cursor: pointer;
    transition: 200ms;
    display: flex;
    align-items: center;
    font-size: 4vh;
    padding-left: 1vw;
    text-decoration: none;
    transition: 200ms ease-in-out;
}

.card:hover {
    color: #e8e8e8;
    transition: 200ms ease-in-out;
    scale: 1.1;
}



@media screen and (max-width: 1000px) {
    .card{
        width: 50vw;
        padding-left: 3vw;
        box-sizing: border-box;        
    }
}
</style>
