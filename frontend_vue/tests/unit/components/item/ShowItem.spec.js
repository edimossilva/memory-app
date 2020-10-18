import { shallowMount } from "@vue/test-utils";
import ShowItem from "@/components/item/ShowItem.vue";
import Vue from "vue";
import VueRouter from "vue-router";
import store from "@/store/index";

Vue.use(VueRouter);

const item = { key: "mockKey1", value: "mockValue1" };

const spyRemoveItem = jest.spyOn(ShowItem.methods, "removeItem");

describe("ListItems.vue", () => {
  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(ShowItem, {
      store,
      propsData: { item },
    });
    expect(wrapper).toMatchSnapshot();
  });

  describe("methods", () => {
    describe("onRemoveButtonClick()", () => {
      const wrapper = shallowMount(ShowItem, {
        store,
        propsData: { item },
      });

      beforeEach(() => {
        wrapper.vm.onRemoveButtonClick();
      });

      it("should call push to dashboard", () => {
        expect(spyRemoveItem).toHaveBeenCalledWith(item);
      });
    });

    // const wrapper = shallowMount(CreateItemModal, {
    //   store,
    //   stubs: {
    //     modal: true,
    //   },
    //   mocks: {
    //     $modal,
    //   },
    // });

    const $copyText = () => {};
    describe("onCopyButtonClick()", () => {
      const wrapper = shallowMount(ShowItem, {
        store,
        propsData: { item },
        mocks: { $copyText },
      });

      beforeEach(() => {
        wrapper.vm.onCopyButtonClick();
      });
    });
  });
});
