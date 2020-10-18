import { shallowMount } from "@vue/test-utils";
import App from "@/App.vue";
import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);
describe("App.vue", () => {
  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(App);
    expect(wrapper).toMatchSnapshot();
  });
});
