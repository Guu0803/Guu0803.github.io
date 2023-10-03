<template>
    <div class="tela">
        <div class="titulo">
            Categorias
        </div>
        <div class="conteiner-cards">
            <router-link to="/animes" class="link">
                <card texto="Animes" />
            </router-link>
            <router-link to="/filmes" class="link">
                <card texto="Filmes" />
            </router-link>
            <router-link to="/series" class="link">
                <card texto="Séries" />
            </router-link>

        </div>
        <alerta v-if="aviso == true" />

    </div>
</template> 
<script>
import card from '@/components/Catalago.vue'
import alerta from '@/components/msgAlerta.vue'

export default {
    name: "categoryPage",
    components: {
        card,
        alerta
    },
    data() {
        return {
            aviso: false
        }
    },
    created() {
        this.tokenAccess = localStorage.getItem("token")
        if (this.tokenAccess) {
            const axios = require('axios')
            let endereço = "https://easy-password.up.railway.app/account/me/"
            let header = { authorization: "Bearer " + this.tokenAccess }
            let config = { headers: header }
            axios.get(endereço, config).then(response => {
                console.log(response)
            }).catch(error => {
                if (error) {
                    localStorage.removeItem('usuarioLogado')
                    localStorage.removeItem('token')
                    this.$router.push('/login')
                    

                }
            })
        } else {
            this.aviso = true
        }
    }
}
</script>
<style scoped>
.tela {
    width: 100%;
    display: flex;
    padding: 2vw 0;
}

.titulo {
    color: #e8e8e8;
    font-size: 4vh;
    margin-left: 5vw;
}

.conteiner-cards {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 3vw;
}

.link {
    text-decoration: none;
}


@media screen and (max-width: 1000px) {
    .tela {
        flex-direction: column;
        align-items: center;
        gap: 3vh;
    }
    
    .conteiner-cards{ 
        flex-direction: column;
        width: 70vw;
        margin-bottom: 5vh;
    }
}
</style>