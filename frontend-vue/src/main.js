import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import moment from 'moment'
import Autocomplete from 'vuejs-auto-complete'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faCog, faUser } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faCog, faUser)

Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('autocomplete', Autocomplete);

require("./assets/main.css");

Vue.config.productionTip = false
Vue.prototype.$http = axios
Vue.prototype.moment = moment 

Vue.filter('toCurrency', function (value) {
  if (typeof value !== "number") {
      return value;
  }
  var formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 2
  });
  return formatter.format(value);
});

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')