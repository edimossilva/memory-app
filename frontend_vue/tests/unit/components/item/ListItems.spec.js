import { shallowMount } from "@vue/test-utils";
import ListItems from "@/components/item/ListItems.vue";
import Vue from "vue";
import VueRouter from "vue-router";
import store from "@/store/index";

Vue.use(VueRouter);
const item1 = { key: "mockKey1", value: "mockValue1" };
const item2 = { key: "mockKey2", value: "mockValue2" };
const mockItems = [item1, item2];
describe("ListItems.vue", () => {
  it("Matchs Snapshot", () => {
    const wrapper = shallowMount(ListItems, {
      store,
      computed: { items: () => mockItems },
    });
    expect(wrapper).toMatchSnapshot();
  });
  describe("computed", () => {
    describe("filteredItems", () => {
      describe("When filter is empty", () => {
        const wrapper = shallowMount(ListItems, {
          store,
          propsData: { filter: "" },
          computed: { items: () => mockItems },
        });
        it("should has all items", () => {
          expect(wrapper.vm.filteredItems).toBe(mockItems);
        });
      });
      describe("When filter match on item", () => {
        const wrapper = shallowMount(ListItems, {
          store,
          computed: { items: () => mockItems },
        });

        wrapper.setData({
          filter: "Key1",
        });

        it("should has only filtered item", () => {
          expect(wrapper.vm.filteredItems).toStrictEqual([item1]);
        });
      });
    });
  });
});
