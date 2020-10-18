<template>
  <div class="home">
    <h1>Home</h1>
    <btn
      label="add"
      :onClick="onClickAddButton"
      dataId="home__add-item-button-js"
    ></btn>
    <create-item-modal></create-item-modal>
    <list-items></list-items>
  </div>
</template>

<script>
import Btn from "@/components/Btn.vue";
import ListItems from "@/components/item/ListItems.vue";
import CreateItemModal from "@/modals/CreateItemModal.vue";

export default {
  name: "Home",
  components: { Btn, ListItems, CreateItemModal },
  methods: {
    onClickAddButton() {
      this.$modal.show("create-item-modal");
    },
  },
};
</script>
