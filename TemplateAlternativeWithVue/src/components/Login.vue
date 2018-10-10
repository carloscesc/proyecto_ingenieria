<template>
  <v-app id="inspire" class="transparent">
    <v-content>
      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md3>
            <v-card class="elevation-12 pt-3 pb-3">
              <v-container fluid color="loginToolbar" class="pa-0">
                <v-layout align-center justify-center column>
                  <v-flex xs12>
                    <v-card flat>
                      <v-card-text>
                        <v-img :src="logo.path" height="55px" width="60px"></v-img>
                        <span class="title">GoBus</span>
                      </v-card-text>
                    </v-card>
                  </v-flex>
                </v-layout>
              </v-container>
              <v-card-text>
                <v-flex xs12>
                  <span class="headline">Iniciar sesión</span>
                  <v-form>
                    <v-text-field name="email" label="Correo electronico" type="text"></v-text-field>
                    <v-text-field id="password" name="password" label="Contraseña" type="password"></v-text-field>
                  </v-form>
                  <span class="body-1">¿Olvidaste la contraseña?</span>
                </v-flex>
              </v-card-text>
              <v-card-actions>
                <v-container fluid class="pa-1">
                  <v-flex xs12>
                  <v-btn color="loginSignIn" dark large block @click="navigateTo(routes.dashboard)">Iniciar sesión</v-btn>
                </v-flex>
                <br/>
                <v-layout row wrap column >
                  <v-flex xs12 class="mb-1">
                    <v-btn color="loginFacebook" dark block @click="navigateTo(routes.dashboard)">
                      <v-icon left>fab fa-facebook</v-icon>Iniciar sesión con Facebook
                    </v-btn>
                  </v-flex>
                  <v-flex xs12>
                    <v-btn color="loginGoogle" dark block @click="navigateTo(routes.dashboard)">
                      <v-icon left>fab fa-google-plus-g</v-icon>Iniciar sesión con Google
                    </v-btn>
                  </v-flex>
                </v-layout>
                </v-container>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    drawer: null,
    routes: {
      dashboard: '/dashboard'
    },
    logo: {
      path: '/static/doc-images/cards/icon_bus.ico.png'
    },
    background: {
      path: '/static/doc-images/background.jpg'
    }
  }),
  props: {
    source: String
  },
  methods: {
    navigateTo: function(nav) {
      this.$router.push(nav)
    }
  }
}
</script>