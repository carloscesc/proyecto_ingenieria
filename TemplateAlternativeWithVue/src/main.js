// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@fortawesome/fontawesome-free/css/all.css'
import Vuetify from 'vuetify'
import 'babel-polyfill'
import colors from 'vuetify/es5/util/colors'

Vue.config.productionTip = false
Vue.use(Vuetify, {
  theme: {
    loginToolbar: '#FFFFFF',
    loginSignIn: colors.red.accent4,
    loginFacebook: colors.blue.accent4,
    loginGoogle: colors.red.accent3
  },
  iconfont: 'fa'
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
