import { shallowMount } from "@vue/test-utils";
import Home from "@/views/Home.vue";
import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);
describe("Home.vue", () => {
  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(Home);
    expect(wrapper).toMatchSnapshot();
  });
  describe("methods", () => {
    describe("onClickAddButton()", () => {
      const show = jest.fn();
      const $modal = { show };
      const wrapper = shallowMount(Home, { mocks: { $modal } });

      beforeEach(() => {
        wrapper.vm.onClickAddButton();
      });

      it("should call push to dashboard", () => {
        expect(show).toHaveBeenNthCalledWith(1, "create-item-modal");
      });
    });
  });
});
