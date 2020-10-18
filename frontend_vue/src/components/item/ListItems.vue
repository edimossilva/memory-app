<template>
  <div>
    <h1>ListItems</h1>
    <input type="text" v-model="filter" class="list-items__filter-js" />

    <div v-for="item in filteredItems" :key="item.key">
      <show-item :item="item"></show-item>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import ShowItem from "@/components/item/ShowItem.vue";
export default {
  name: "ListItems",
  data() {
    return {
      item: { key: "", value: "" },
      filter: "",
    };
  },
  components: { ShowItem },
  computed: {
    ...mapState(["items"]),
    filteredItems() {
      const { items, filter } = this;
      if (filter) return items.filter((item) => item.key.includes(filter));
      return items;
    },
  },
};
</script>
