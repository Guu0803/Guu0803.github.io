<template>
    <div class="tela">
        Sobre
        <div class="conteiners">
            Bem-vindo à SpaceFlix, o seu portal definitivo para entretenimento sem limites! Estamos aqui para oferecer
            uma experiência de streaming única, repleta de uma ampla seleção de filmes, séries e documentários que cativarão
            sua imaginação e o levarão a novos horizontes. Na SpaceFlix, acreditamos que cada história tem o poder de
            nos transportar para mundos desconhecidos e despertar emoções profundas.
        </div>
        <div class="conteiners">
            <div class="titulo ">
                Nossa Missão
            </div>
            Nossa missão é simples: enriquecer sua vida com narrativas excepcionais e visuais impressionantes. Estamos
            comprometidos em fornecer conteúdo que não apenas entretenha, mas também inspire e conecte as pessoas por meio
            de histórias compartilhadas. Queremos ser a plataforma que você escolhe para escapar da rotina, explorar mundos
            diferentes e experimentar uma ampla gama de emoções.
        </div>
        <div class="conteiners">
            <div class="titulo ">
                O Que Nos Torna Únicos
            </div>
            <div>
                Diversidade de Escolha: Nossa extensa biblioteca oferece uma variedade incomparável de gêneros e estilos.
                Desde aventuras épicas até histórias intimistas, você encontrará algo que ressoe com seu gosto pessoal.
            </div>
            <div>
                Qualidade Intransigente: Valorizamos a qualidade tanto quanto você. Transmitimos todo o nosso conteúdo em
                alta resolução e som imersivo, proporcionando uma experiência cinematográfica no conforto da sua casa.
            </div>
            <div>
                Produções Originais Exclusivas: Estamos constantemente inovando com produções originais que você só
                encontrará na SpaceFlix. Nossos criadores trabalham arduamente para trazer novas perspectivas e abordagens únicas às
                histórias que você adora.
            </div>
            <div>
                Comunidade Acolhedora: Junte-se a uma comunidade apaixonada por histórias. Nossas opções de interação
                permitem que você compartilhe suas opiniões, discuta teorias e conecte-se com outros amantes do entretenimento.
            </div>
        </div>
        <div class="conteiners">
            <div class="titulo ">
                Nosso Time Criativo
            </div>
            Por trás das cortinas, nossa equipe é formada por cineastas, roteiristas, designers e especialistas apaixonados
            por contar histórias. Trabalhamos incansavelmente para criar uma experiência cativante que transcenda a tela e
            leve você a novos mundos.
        </div>
        <div class="conteiners">
            <div class="titulo ">
                Junte-se à Jornada
            </div>
            Se você busca escapismo, inspiração ou apenas uma boa dose de entretenimento, a SpaceFlix é o lugar para
            você. Faça parte da nossa jornada para descobrir as narrativas mais envolventes e visualmente impressionantes
            que o mundo do entretenimento tem a oferecer.
        </div>
        <div class="conteiners">
            <div class="titulo ">
                Contate-Nos
            </div>
            Adoraríamos ouvir de você! Se tiver alguma pergunta, sugestão ou apenas quiser compartilhar seus pensamentos,
            não hesite em entrar em contato conosco pelo GitHub. Seu feedback é fundamental para aprimorar
            a experiência da SpaceFlix.
            Explore. Sonhe. Assista. Bem-vindo a um universo de histórias inesquecíveis na SpaceFlix.
        </div>
    </div>
</template>
<script>
export default {
    name: 'paginaSobre'
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
.conteiners div {
    margin-bottom: 1vw;
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