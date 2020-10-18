import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    items: [],
  },
  mutations: {
    addItem(state, item) {
      state.items.push(item);
    },
    removeItem(state, item) {
      const index = state.items.findIndex((i) => i.key === item.key);
      state.items.splice(index, 1);
    },
    // mutate(state, payload) {
    //   state[payload.property] = payload.value;
    // },
  },
  actions: {
    addItem({ commit }, item) {
      commit("addItem", { ...item });
    },
    removeItem({ commit }, item) {
      commit("removeItem", item);
    },
  },
  modules: {},
});
