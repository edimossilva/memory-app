import { shallowMount } from "@vue/test-utils";
import CreateItemModal from "@/modals/CreateItemModal.vue";
import Vue from "vue";
import VueRouter from "vue-router";
import store from "../../../src/store/index";

Vue.use(VueRouter);
describe("CreateItemModal.vue", () => {
  const spyUpdate = jest.spyOn(CreateItemModal.methods, "addItem");

  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(CreateItemModal, {
      stubs: {
        modal: true,
      },
    });
    expect(wrapper).toMatchSnapshot();
  });
  describe("methods", () => {
    describe("onCreateButtonClick()", () => {
      const $modal = { hide: jest.fn() };
      const wrapper = shallowMount(CreateItemModal, {
        store,
        stubs: {
          modal: true,
        },
        mocks: {
          $modal,
        },
      });

      beforeEach(() => {
        wrapper.vm.onCreateButtonClick();
      });

      it("should call push to dashboard", () => {
        expect(spyUpdate).toHaveBeenCalled();
      });
    });
  });
});
