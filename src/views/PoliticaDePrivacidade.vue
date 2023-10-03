<template>
    <div class="tela">
        Política de Privacidade
        <div class="conteiners">
            Seja bem-vindo ao nosso SpaceFlix! A privacidade dos nossos usuários é de extrema importância
            para
            nós. Nesta Política de Privacidade, explicamos como coletamos, usamos, compartilhamos e protegemos as
            informações
            pessoais fornecidas durante o uso do nosso site. Ao acessar e usar nossos serviços, você concorda com os termos
            desta Política de Privacidade.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Coleta de Informações:
            </div>
            a. Coletamos informações pessoais fornecidas por você ao criar uma conta, como nome, endereço de e-mail, data de
            nascimento e preferências de conteúdo.
            b. Podemos coletar automaticamente informações do dispositivo que você utiliza para acessar o site, incluindo
            endereço IP, tipo de navegador e sistema operacional.
        </div>
        
        <div class="conteiners">
            <div class="titulo">
                Uso das Informações:
            </div>
            a. Utilizamos as informações coletadas para fornecer e melhorar nossos serviços de streaming.
            b. Personalizamos a experiência do usuário, recomendando conteúdos relevantes com base em suas preferências.
            c. Podemos utilizar informações para fins de análise e aprimoramento do desempenho do site.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Compartilhamento de Informações:
            </div>
            a. Não compartilhamos informações pessoais identificáveis com terceiros sem o seu consentimento, exceto quando
            exigido por lei.
            b. Podemos compartilhar informações agregadas ou anonimizadas para fins estatísticos e de marketing.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Segurança das Informações:
            </div>
            a. Implementamos medidas de segurança para proteger suas informações pessoais contra acesso não autorizado ou
            uso
            indevido.
            b. No entanto, nenhum sistema de transmissão ou armazenamento de dados é totalmente seguro, e não podemos
            garantir a
            segurança absoluta das informações fornecidas.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Cookies e Tecnologias Similares:
            </div>
            a. Utilizamos cookies e tecnologias similares para melhorar a experiência do usuário e coletar informações sobre
            o
            uso do site.
            b. Você pode gerenciar as preferências de cookies em seu navegador, mas isso pode afetar algumas funcionalidades
            do
            site.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Menores de Idade:
            </div>
            a. Nossos serviços não se destinam a menores de 18 anos. Não coletamos intencionalmente informações pessoais de
            crianças sem consentimento dos pais ou responsáveis legais.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Alterações na Política de Privacidade:
            </div>
            a. Reservamo-nos o direito de alterar esta Política de Privacidade a qualquer momento. Atualizaremos a data da
            "última atualização" no início do documento.
        </div>

        <div class="conteiners">
            Ao utilizar nosso site, você concorda com os termos desta Política de Privacidade. Caso tenha alguma dúvida ou
            preocupação sobre nossas práticas de privacidade, entre em contato conosco através dos canais de suporte
            fornecidos
            no site. Agradecemos a confiança em nosso serviço de streaming!
        </div>

    </div>
</template>
<script>
export default {
    name: "paginaPoliticaDePrivacidade"
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
.titulo{
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