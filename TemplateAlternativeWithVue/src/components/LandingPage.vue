<template>
  <v-app id="inspire">
    <v-container fluid class="pa-0">
      <v-img :src="background.path" style="height: 100vh;">
        <v-toolbar
        :clipped-left="$vuetify.breakpoint.lgAndUp"
        color="transparent elevation-0"
        dark
        app
        absolute
        scroll-off-screen
        >

          <!-- btn-home -->
          <v-toolbar-items class="hidden-xs-only">
            <v-btn flat large depressed>
              <span class="display-1 red--text text--darken-2 font-weight-black">Go</span>
              <v-avatar size="64px">
                <img :src="logo.path" alt="GoBus">
              </v-avatar>
              <span class="display-1 red--text text--darken-2 font-weight-black">Bus</span>
            </v-btn>
          </v-toolbar-items>

          <!-- bottom-sheet -->
          <v-toolbar-items class="hidden-sm-and-up">
            <v-bottom-sheet v-model="sheet">
              <v-btn flat large depressed slot="activator">
                <span class="display-1 red--text text--darken-2 font-weight-black">Go</span>
                <v-avatar size="64px">
                  <img :src="logo.path" alt="GoBus">
                </v-avatar>
                <span class="display-1 red--text text--darken-2 font-weight-black">Bus</span>
              </v-btn>
              <v-list>
                <v-subheader>GoBus</v-subheader>
                  <v-list-tile v-for="tile in tiles" :key="tile.title" @click="sheet = false">
                    <v-list-tile-title>{{ tile.title }}</v-list-tile-title>
                  </v-list-tile>
              </v-list>
            </v-bottom-sheet>
          </v-toolbar-items>

          <!-- spacer -->
          <v-spacer class="hidden-xs-only"></v-spacer>

          <!-- btn-actions -->
          <v-toolbar-items class="hidden-xs-only">
            <v-btn dark flat @click="navigateTo(routes.login)">Iniciar Sesión</v-btn>
            <v-btn dark flat>Registrarse</v-btn>
          </v-toolbar-items>
        </v-toolbar>

        <v-layout pa-2 column fill-height class="lightbox white--text">
          <v-spacer></v-spacer>
          <v-flex shrink>
            <div class="display-3">Adquiere tu boleto!</div>
            <div class="subheading">DISFRUTA VIAJAR DONDE QUIERAS</div>
            <div class="subheading">Y CANCELA CUANDO QUIERAS.</div>
          </v-flex>
        </v-layout>
      </v-img>
      <v-footer id="footer" class="grey darken-4" height="auto">
        <v-container fluid grid-list-sm>
          <v-layout row class="mt-1" wrap>
            <v-flex xs12 sm17 md7 lg7 xl7>
              <v-card flat class="transparent">
                <v-card-text>
                  <div class="display-2 white--text">
                    Si piensas que GoBus no es lo tuyo,
                    no hay problema, sin compromisos utiliza nuestra plataforma
                    y cancela online cuando quieras.
                  </div>
                </v-card-text>
              </v-card>
            </v-flex>
            <v-flex xs12 sm5 md5 lg5 xl5>
              <v-card flat class="transparent">
                <v-img :src="appli.path"></v-img>
              </v-card>
            </v-flex>
            <v-divider></v-divider>
            <v-divider></v-divider>
            <v-flex transparent text-xs-center white--text xs12>
            &copy; — <strong>HAKANC - Devs 2018</strong>
            </v-flex>
          </v-layout>
        </v-container>
      </v-footer>
    </v-container>
  </v-app>
</template>

<script>
export default {
  name: 'LandingPage',
  data: () => ({
    sheet: false,
    tiles: [
      { title: 'Inicio' },
      { title: 'Iniciar sesión' },
      { title: 'Registrarse' }
    ],
    routes: {
      login: '/login'
    },
    logo: {
      path: '/static/doc-images/cards/icon_bus.ico.png'
    },
    background: {
      path: '/static/doc-images/background.jpg'
    },
    appli: {
      path: '/static/doc-images/app.png'
    }
  }),
  methods: {
    navigateTo: function(nav) {
      this.$router.push(nav)
    }
  }
}
</script>

