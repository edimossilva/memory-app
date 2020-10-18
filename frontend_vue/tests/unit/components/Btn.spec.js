import { shallowMount } from "@vue/test-utils";
import Btn from "@/components/Btn.vue";
import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);
describe("Btn.vue", () => {
  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(Btn, {
      propsData: { label: "mock label" },
    });
    expect(wrapper).toMatchSnapshot();
  });
});
