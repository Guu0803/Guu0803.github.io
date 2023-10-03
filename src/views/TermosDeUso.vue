<template>
    <div class="tela">
        Termos de Uso
        <div class="conteiners">
            Bem-vindo ao nosso site SpaceFlix! Antes de começar a aproveitar nosso conteúdo emocionante, é
            importante que você leia e concorde com os seguintes termos de uso. Ao acessar e usar nosso site, você concorda
            com
            todos os termos e condições abaixo:

        </div>
        <div class="conteiners">
            <div class="titulo">
                Conteúdo do Site:
            </div>
            a. Nosso site oferece uma variedade de conteúdos de streaming, incluindo filmes, séries, documentários e muito
            mais.
            b. O conteúdo disponível está sujeito a alterações sem aviso prévio.
            c. Alguns conteúdos podem estar sujeitos a restrições de idade e podem exigir a confirmação da sua idade antes
            de
            serem reproduzidos.

        </div>

        <div class="conteiners">
            <div class="titulo">
                Uso Pessoal:
            </div>
            a. O conteúdo do site destina-se exclusivamente para uso pessoal e não comercial.
            b. Você concorda em não reproduzir, distribuir, transmitir, vender, alugar, emprestar ou modificar qualquer
            conteúdo
            do site sem autorização prévia por escrito.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Conta do Usuário:
            </div>
            a. Ao criar uma conta, você é responsável por fornecer informações precisas e atualizadas.
            b. Você é responsável por manter a confidencialidade de suas informações de login e senha.
            c. Qualquer atividade realizada em sua conta é de sua responsabilidade.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Uso Aceitável:
            </div>
            a. Ao usar nosso site, você concorda em não:
            i. Publicar, transmitir ou compartilhar qualquer conteúdo ilegal, ameaçador, difamatório, obsceno ou ofensivo.
            ii. Violar direitos autorais, marcas registradas ou qualquer outro direito de propriedade intelectual.
            iii. Interferir ou prejudicar a segurança ou o funcionamento adequado do site.
            b. Reservamo-nos o direito de suspender ou encerrar sua conta se você violar essas condições.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Privacidade:
            </div>
            a. Respeitamos sua privacidade e tratamos seus dados pessoais de acordo com nossa política de privacidade.
            b. Podemos coletar informações sobre o uso do site para melhorar nossos serviços e personalizar sua experiência.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Limitação de Responsabilidade:
            </div>
            a. O uso do site é por sua conta e risco. Não nos responsabilizamos por quaisquer danos, perdas ou problemas
            decorrentes do uso do site.
            b. Não garantimos a disponibilidade contínua do site ou a compatibilidade com todos os dispositivos.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Alterações nos Termos de Uso:
            </div>
            Reservamo-nos o direito de alterar estes termos de uso a qualquer momento. Recomendamos que você revise
            periodicamente os termos atualizados.
        </div>

        <div class="conteiners">
            Ao utilizar nosso site, você concorda em cumprir estes termos de uso. Esperamos que você aproveite ao máximo a
            sua
            experiência de streaming!
        </div>

    </div>
</template>
<script>
export default {
    name: "paginaTermosDeUso"
}
</script>
<style scoped>
.tela {
    color: #f64348;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 5vh 0;
    gap: 2vw;
    font-size: 4vh;
}

.titulo {
    color: #f64348;
}

.conteiners {
    max-width: 90vw;
    color: #e8e8e8;
    font-size: 3vh;
}



@media screen and (max-width:1000px) {
    .conteiners{
        font-size: 0.6em;
    }
}
</style>