<template>
  <div class=tela>
    <div class="cabecalho">
      <div class="menu-mobile" v-on:click="mostrarMenu()">
        <span class="material-icons menu">
          menu
        </span>
      </div>
      <div class="conteiner-logo" v-on:click="toInicio()">
        <img src="@/assets/logo.png" class="logo">
      </div>
      <div class="conteiner-escrita">
        <RouterLink to="/home" class="escrita-cabecalho">
          Início
        </RouterLink>
        <div class="dropdown-conteiner">
          <router-link to="/categoria" class="escrita-cabecalho">
            Categorias
          </router-link>
          <div class="conteudo-dropdown">
            <router-link to="/animes" class="escrita-dropdown">
              Animes
            </router-link>
            <router-link to="/filmes" class="escrita-dropdown">
              Filmes
            </router-link>
            <router-link to="/series" class="escrita-dropdown">
              Séries
            </router-link>
          </div>
        </div>
        <RouterLink to="/minha-lista" class="escrita-cabecalho">
          Minha lista
        </RouterLink>
        <RouterLink to='/meus-downloads' class="escrita-cabecalho">
          Meus downloads
        </RouterLink>
        <div class="conteiner-pesquisa">
          <input type="text" placeholder="Procurar" v-model="conteudoPesquisa" v-on:keyup.enter="filtrar()">
          <span class="material-icons lupa" v-if="!conteudoPesquisa">
            search
          </span>
          <span class="material-icons lupa" v-if="conteudoPesquisa" v-on:click="limpar()">
            clear
          </span>
        </div>
      </div>
      <div>
        <span class="material-icons lupa-mobile" v-if="!conteudoPesquisa" v-on:click.stop="mostrarPesquisaMobile()">
          search
        </span>
        <div class="dropdown-conteiner">
          <div class="nome-usuario">
            <span v-on:click="showMenuUsuario()" class="material-icons icone-usuario">
              account_circle
            </span>
            <div v-if="usuarioLogado" class="nome-user">
              {{ usuarioLogado.nomeUsuario }}
            </div>
          </div>
          <div class="conteudo-dropdown" v-if="usuarioLogado">
            <router-link to="/minha-conta" class="escrita-dropdown">
              Conta
            </router-link>
            <router-link to="/meu-perfil" class="escrita-dropdown">
              Perfil
            </router-link>
            <router-link to="/ajuda" class="escrita-dropdown">
              Ajuda
            </router-link>
            <div class="escrita-dropdown" v-on:click="deslogar()">
              Sair
            </div>
          </div>
          <div class="conteudo-dropdown" v-if="!usuarioLogado">
            <RouterLink to="/login" class="escrita-dropdown">
              Login
            </RouterLink>
            <RouterLink to="/cadastro" class="escrita-dropdown">
              Criar Conta
            </RouterLink>
          </div>
        </div>
      </div>
    </div>
    <div class="input-pesquisa-mobile" v-if="pesquisaMobile">
      <input type="text" placeholder="Procurar" v-model="conteudoPesquisa" v-on:keyup.enter="filtrar()"
        class="pesquisa-mobile">
      <span class="material-icons close" v-on:click="limpar()">
        clear
      </span>
    </div>
    <div :style="darken()" v-if="menuUser || navMobile" v-on:click.stop="fecharMenus()">
    </div>
    <div class="menu-usuario" v-if="menuUser">
      <div v-if="usuarioLogado">
        <div>
          {{ usuarioLogado.nomeUsuario }}
        </div>
        <div v-on:click="toConta()" class="escrita-dropdown">
          Conta
        </div>
        <div v-on:click="toPerfil()" class="escrita-dropdown">
          Perfil
        </div>
        <div v-on:click="toAjuda()" class="escrita-dropdown">
          Ajuda
        </div>
        <div class="escrita-dropdown" v-on:click="deslogar()">
          Sair
        </div>
      </div>
      <div v-if="!usuarioLogado">
        <div v-on:click="toLogin()" class="escrita-dropdown">
          Login
        </div>
        <div v-on:click="toCadastro()" class="escrita-dropdown">
          Criar Conta
        </div>
      </div>
    </div>
    <div class="nav-mobile" v-if="navMobile">
      <div v-on:click="toHome()" class="escrita-menu-mobile">
        Início
      </div>
      <details>
        <summary>
          <span class="material-icons">
            expand_more
          </span>
          Categorias
        </summary>
        <div>
          <div v-on:click="toAnimes()" class="escrita-menu-mobile">
            Animes
          </div>
          <div v-on:click="toFilmes()" class="escrita-menu-mobile">
            Filmes
          </div>
          <div v-on:click="toSeries()" class="escrita-menu-mobile">
            Séries
          </div>
        </div>
      </details>
      <div v-on:click="toLista()" class="escrita-menu-mobile">
        Minha lista
      </div>
      <div v-on:click="toDownloads()" class="escrita-menu-mobile">
        Meus downloads
      </div>
    </div>

    <router-view class="page-body" />

    <div class="rodape">
      <div class="conteiner-subtitulos">
        <div class="subtitulos-rodape">
          Contatos
        </div>
        <div class="escrita-rodape">
          <img src="@/assets/instagram.svg">
          Instagram
        </div>
        <div class="escrita-rodape">
          <img src="@/assets/facebook.svg">
          Facebook
        </div>
        <div class="escrita-rodape">
          <img src="@/assets/twitter.svg">
          Twitter
        </div>
        <div class="escrita-rodape">
          <img src="@/assets/github.png">
          <a class="escrita-rodape" href="https://github.com/Guu0803" target="_blank"
            rel="noopener noreferrer">Guu0803</a>
        </div>
      </div>
      <div class="conteiner-subtitulos">
        <div class="subtitulos-rodape">
          SpaceFlix
        </div>
        <RouterLink to="/sobre" class="escrita-rodape">
          Sobre
        </RouterLink>
        <RouterLink to="/ajuda" class="escrita-rodape">
          Ajuda
        </RouterLink>
        <router-link to="/termos-de-uso" class="escrita-rodape">
          Termos de Uso
        </router-link>
        <router-link to="/politica-de-privacidade" class="escrita-rodape">
          Política de Privacidade
        </router-link>
        <router-link to="/aviso-legal" class="escrita-rodape">
          Aviso Legal
        </router-link>
      </div>
      <div class="conteiner-subtitulos">
        <RouterLink to="/minha-conta" class="subtitulos-rodape">
          Conta
        </RouterLink>
        <RouterLink to="/login" class="escrita-rodape">
          Login
        </RouterLink>
        <RouterLink to="/cadastro" class="escrita-rodape">
          Criar Conta
        </RouterLink>
      </div>
    </div>

    <div class="voltar-topo" v-on:click="voltarTopo()">
      <span class="material-icons topo">
        expand_less
      </span>
    </div>

  </div>
</template>
<script>
export default {
  data() {
    return {
      conteudoPesquisa: '',
      usuarioLogado: '',
      pesquisaMobile: false,
      menuUser: false,
      navMobile: false
    }
  },
  methods: {
    voltarTopo() {
      window.scroll({
        top: 0,
        behavior: 'smooth'
      });
    },
    toInicio() {
      if (!this.usuarioLogado) {
        this.$router.push('/')
      }
    },
    toConta() {
      this.$router.push('/minha-conta')
      this.menuUser = false
      this.navMobile = false
    },
    toPerfil() {
      this.$router.push('/meu-perfil')
      this.menuUser = false
      this.navMobile = false
    },
    toAjuda() {
      this.$router.push('/ajuda')
      this.menuUser = false
      this.navMobile = false
    },
    toCadastro() {
      this.$router.push('/cadastro')
      this.menuUser = false
      this.navMobile = false
    },
    toLogin() {
      this.$router.push('/login')
      this.menuUser = false
      this.navMobile = false
    },
    toHome() {
      this.$router.push('/home')
      this.menuUser = false
      this.navMobile = false
    },
    toAnimes() {
      this.$router.push('/animes')
      this.menuUser = false
      this.navMobile = false
    },
    toFilmes() {
      this.$router.push('/filmes')
      this.menuUser = false
      this.navMobile = false
    },
    toSeries() {
      this.$router.push('/series')
      this.menuUser = false
      this.navMobile = false
    },
    toLista() {
      this.$router.push('/minha-lista')
      this.menuUser = false
      this.navMobile = false
    },
    toDownloads() {
      this.$router.push('/meus-downloads')
      this.menuUser = false
      this.navMobile = false
    },

    filtrar() {
      if (this.conteudoPesquisa) {
        this.$router.push('/resultado-pesquisa')
        this.$store.commit('textoAttPesquisa', this.conteudoPesquisa)
      }
    },

    limpar() {
      this.conteudoPesquisa = ''
      this.pesquisaMobile = false
    },
    showMenuUsuario() {
      if (this.menuUser) {
        this.menuUser = false
      } else {
        this.menuUser = true
        this.navMobile = false
      }
    },
    mostrarMenu() {
      if (this.navMobile) {
        this.navMobile = false
      } else {
        this.navMobile = true
        this.menuUser = false
      }
    },
    fecharMenus() {
      this.menuUser = false
      this.navMobile = false
    },
    mostrarPesquisaMobile() {
      if (this.pesquisaMobile == false) {
        this.pesquisaMobile = true
      } else {
        this.pesquisaMobile = false
      }
    },
    deslogar() {
      localStorage.removeItem('usuarioLogado')
      localStorage.removeItem('token')
      this.$router.push('/login')
      setTimeout(() => {
        window.location.reload();
      }, 100);
    },
    darken() {
      return 'background-color: rgba(0,0,0,0.7);width: 100%; height:100vh; position:absolute; z-index:8'
    }
  },
  watch: {
    conteudoPesquisa(value) {
      this.$store.commit('textoAttPesquisa', value)
    }
  },
  created() {
    let usuarioLogado = localStorage.getItem('usuarioLogado')
    usuarioLogado = JSON.parse(usuarioLogado)
    if (usuarioLogado) {
      this.usuarioLogado = usuarioLogado
    }
  }
}
</script>
<style>
body {
  margin: 0;
  padding: 0;
  background-color: #1f1f1f;
  font-family: 'Karla', sans-serif;
  display: flex;
  height: 100vh;
  flex-direction: column;
  justify-content: space-between;
}

.page-body {
  min-height: 65vh;
}

.menu-usuario {
  display: none;
}

.voltar-topo {
  position: fixed;
  bottom: 2vw;
  right: 2vw;
  background-color: #121212;
  opacity: .5;
  border-radius: 50%;
  cursor: pointer;
  width: 4vw;
  height: 4vw;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #e8e8e8;
  transition: 300ms ease-in-out;
}

.voltar-topo:hover {
  opacity: 1;
  color: #f64348;
}

.topo {
  font-size: 7vh;
}

.menu-mobile {
  display: none;
}

.cabecalho {
  width: 100%;
  background-color: #121212;
  display: flex;
  gap: 2vw;
  align-items: center;
  justify-content: space-evenly;
  height: 8vh;
}

.conteiner-logo {
  height: 8vh;
}

.logo {
  height: 100%;
  padding-top: 1px;
  cursor: pointer;
}

.conteiner-escrita {
  display: flex;
  align-items: center;
  gap: 2vw;
  height: 100%;

}

.dropdown-conteiner {
  position: relative;
  display: inline-flex;
  justify-content: center;
  height: 100%;
}

.escrita-cabecalho {
  text-decoration: none;
  color: #e8e8e8;
  font-size: 3vh;
  transition: 100ms;
  height: 90%;
  display: flex;
  align-items: center;
  border-bottom: 3px solid #121212;
}

.conteudo-dropdown {
  display: none;
  position: absolute;
  top: 8vh;
  background-color: #343434;
  width: 8vw;
  z-index: 1;
  box-shadow: 1.5vh 1.5vh 5vh black;
  text-align: center;

}

.escrita-dropdown {
  color: #e8e8e8;
  padding: 1vh 0;
  display: block;
  cursor: pointer;
  transition: 200ms;
  text-decoration: none;
}

.escrita-dropdown:hover {
  background-color: #f64348;
  color: #e8e8e8;
  transition: 200ms;
}

.dropdown-conteiner:hover .conteudo-dropdown {
  display: flex;
  flex-direction: column;
  transition: 300ms;
}

.escrita-cabecalho:hover {
  cursor: pointer;
  color: #f64348;
  border-color: #f64348;
  transition: 100ms;
}

.input-pesquisa-mobile {
  display: none;
}

.conteiner-pesquisa {
  display: flex;
  align-items: center;
}

.conteiner-pesquisa-mobile {
  display: none;
}

.icones-cabecalho {
  font-size: 5vh;
  color: #e8e8e8;
  cursor: pointer;
  display: flex;
  align-items: center;

}

.icone-usuario {
  font-size: 7vh;
  color: #e8e8e8;
  cursor: pointer;
  padding: 1vh 0;
}

.nome-usuario {
  color: #e8e8e8;
  display: flex;
  align-items: center;
  gap: 1vh;
  cursor: pointer;
}

.lupa-mobile {
  display: none;
}

.lupa {
  font-size: 3.5vh;
  color: #e8e8e8;
  cursor: pointer;
  margin-left: -2.5vw
}

.icones-cabecalho:hover {
  color: #f64348;
}

.rodape {
  padding: 1vw 0;
  width: 100%;
  background-color: #181818;
  height: fit-content;
  display: flex;
  justify-content: space-around;
}

.escrita-rodape {
  display: flex;
  align-items: center;
  font-size: 2vh;
  color: #e8e8e8;
  cursor: pointer;
  width: fit-content;
  text-decoration: none;
}

.conteiner-subtitulos {
  display: flex;
  flex-direction: column;
  gap: 1vh;
}

.escrita-rodape:hover {
  color: #f64348;
}

.subtitulos-rodape {
  font-size: 3vh;
  color: #e8e8e8;
  cursor: pointer;
  width: fit-content;
  text-decoration: none;
  font-weight: bold;
}

.subtitulos-rodape:hover {
  color: #f64348;
}

input {
  border-radius: 10px;
  border: none;
  background-color: #343434;
  color: #e8e8e8;
  padding: 1vh;
  transition: 200ms ease-in-out;
}

::-webkit-scrollbar {
  width: 1vh;
}

::-webkit-scrollbar-thumb {
  background: #89898950;
  border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
  background-color: #89898990;
}

::-webkit-scrollbar-track {
  background-color: #1f1f1f;
}

.nav-mobile {
  display: none;
}




@media screen and (max-width:1000px) {
  .tela {
    position: relative;
  }

  .cabecalho {
    justify-content: space-between;
    height: 7vh;
    padding: 0 1vw;
    box-sizing: border-box;
  }

  .logo {
    height: 7vh;
    padding-top: 1vw;
  }

  .icone-usuario {
    font-size: 2.1em;
    user-select: none
  }

  .menu-mobile {
    display: block;
    color: #e8e8e8;
    font-size: 0.8em;
  }

  .menu {
    font-size: 2.5em;
  }

  .conteiner-escrita {
    display: none;
  }

  .nome-usuario {
    font-size: 0.9em;
  }

  .conteiner-pesquisa {
    display: none;
  }

  .input-pesquisa-mobile {
    display: block;
    position: absolute;
    z-index: 2;
    border-radius: unset;
    background-color: #121212;
    width: 100%;
    height: fit-content;
    display: flex;
    align-items: center;
    padding: 0 1vw;
    box-sizing: border-box;
  }

  .pesquisa-mobile {
    width: 95%;
    background: transparent;
    border-radius: unset;
    height: 3vh;

  }

  .close {
    color: white;
    margin-left: -7vw;
    font-size: 2.5vh;
    user-select: none;
  }

  .lupa-mobile {
    display: block;
    font-size: 3.5vh;
    user-select: none;
    position: absolute;
    margin-left: -10vw;
    color: white;
    top: 2vh;
  }

  .dropdown-conteiner:hover .conteudo-dropdown {
    display: none;
  }

  .menu-usuario,
  .nav-mobile {
    display: block;
    position: absolute;
    z-index: 10;
    width: 50vw;
    height: 100vh;
    background-color: #121212;
    padding: 1vh 0;
    color: #e8e8e8;
  }

  .menu-usuario {
    right: 0;
    text-align: center;
    font-size: 1.3em;
  }

  .nav-mobile {
    left: 0;
    display: flex;
    flex-direction: column;
    gap: 2vh;
    font-size: 1.5em;
    padding: 0 3vw 0 0;
  }

  .escrita-menu-mobile {
    text-decoration: none;
    color: #e8e8e8;
    margin-left: 6vw;
  }

  details>summary {
    list-style: none;
    display: flex;
    align-items: center;
  }

  details>div {
    display: flex;
    flex-direction: column;
    gap: 1vh;
    margin: 1vh 4vw;
  }

  .nome-user {
    display: none;
  }

  .rodape {
    margin-top: 5vh;
    padding: 1vh 1vh 3vh 1vh;
    box-sizing: border-box;
  }

  .escrita-rodape {
    font-size: 0.8em;
  }

  .conteiner-subtitulos {
    gap: 0.8vh;
  }

  .subtitulos-rodape {
    font-size: 1.3em;
  }

}
</style>
  

