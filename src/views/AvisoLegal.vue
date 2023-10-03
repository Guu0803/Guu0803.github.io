<template>
    <div class="tela">
        Aviso Legal
        <div class="conteiners">
            Este Aviso Legal estabelece os termos e condições para o uso do SpaceFlix  e regula a
            relação entre os usuários e os proprietários do Site. Ao acessar e usar o Site, você concorda em cumprir e estar
            vinculado a estes termos e condições. Se você não concorda com estes termos, por favor, não use o Site.
        </div>
        <div class="conteiners">
            <div class="titulo">
                Direitos Autorais
            </div>
            Todo o conteúdo disponível no Site, incluindo, mas não se limitando a, filmes, séries, documentários, músicas,
            imagens e outros materiais, são protegidos por direitos autorais e outros direitos de propriedade intelectual. A
            reprodução, distribuição ou qualquer uso não autorizado desse conteúdo é estritamente proibido, a menos que seja
            permitido expressamente pelo detentor dos direitos autorais.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Uso Pessoal
            </div>
            O Site é fornecido para uso pessoal e não comercial. Você pode acessar, transmitir e reproduzir o conteúdo
            disponível no Site apenas para uso pessoal e não pode distribuir, modificar, transmitir, exibir publicamente ou
            usar
            o conteúdo para qualquer finalidade comercial sem a autorização prévia por escrito dos proprietários do Site.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Responsabilidade do Usuário
            </div>
            Você é responsável por todas as atividades realizadas em sua conta no Site. Ao usar o Site, você concorda em
            não:
            <div>
                <span class="material-icons dot">
                    fiber_manual_record
                </span>
                Carregar, transmitir ou compartilhar qualquer conteúdo que seja ilegal, difamatório, obsceno, ofensivo,
                ameaçador ou
                que viole os direitos de terceiros.
            </div>
            <div>
                <span class="material-icons dot">
                    fiber_manual_record
                </span>
                Acessar ou tentar acessar contas de outros usuários sem autorização.
            </div>
            <div>
                <span class="material-icons dot">
                    fiber_manual_record
                </span>
                Interferir ou danificar o funcionamento adequado do Site.
            </div>
            <div>
                <span class="material-icons dot">
                    fiber_manual_record
                </span>
                Violar qualquer lei aplicável.
            </div>
        </div>
        <div class="conteiners">
            <div class="titulo">
                Limitação de Responsabilidade
            </div>
            O Site é fornecido "como está", sem garantias de qualquer tipo, expressas ou implícitas. Os proprietários do
            Site
            não garantem a disponibilidade, precisão, integridade ou confiabilidade do conteúdo ou do desempenho do
            Site. Em
            nenhuma circunstância, os proprietários do Site serão responsáveis por quaisquer danos diretos, indiretos,
            incidentais, consequenciais ou punitivos decorrentes do uso ou impossibilidade de uso do Site.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Links Externos
            </div>
            O Site pode conter links para sites de terceiros. Esses links são fornecidos apenas para sua conveniência e
            não
            implicam endosso ou responsabilidade pelo conteúdo desses sites. Os proprietários do Site não têm controle
            sobre
            esses sites e não se responsabilizam por suas práticas de privacidade ou conteúdo.
        </div>

        <div class="conteiners">
            <div class="titulo">
                Alterações no Aviso Legal
            </div>
            Os proprietários do Site reservam o direito de modificar este Aviso Legal a qualquer momento. Quaisquer
            alterações
            serão publicadas no Site. Recomenda-se que você revise regularmente este Aviso Legal para estar ciente de
            quaisquer
            modificações.
        </div>

        <div class="conteiners">
            Ao usar o Site, você concorda em cumprir este Aviso Legal e todas as leis aplicáveis. Se você não concorda
            com
            qualquer disposição deste Aviso Legal, por favor, interrompa imediatamente o uso do Site.
        </div>


    </div>
</template>
<script>
export default {
    name: 'paginaAvisoLegal',
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
    box-sizing: border-box;
}

.titulo {
    color: #f64348;
}

.conteiners {
    max-width: 90vw;
    color: #e8e8e8;
    font-size: 3vh;
}

.dot {
    font-size: 2vh;
    color: #f64348;
    margin: 1vw 0;
}

@media screen and (max-width:1000px) {
    .conteiners{
        font-size: 0.6em;
    }
}

</style>