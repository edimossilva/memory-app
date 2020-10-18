import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VModal from "vue-js-modal";
import VueClipboard from "vue-clipboard2";

Vue.config.productionTip = false;
Vue.use(VModal);
Vue.use(VueClipboard);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
