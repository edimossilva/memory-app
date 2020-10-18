<template>
  <modal name="create-item-modal" class="create-item-modal-js">
    <label> Key: </label>
    <input
      v-model="item.key"
      type="text"
      class="create-item-modal--input-key-js"
    />
    <label> Value: </label>
    <input
      v-model="item.value"
      type="text"
      class="create-item-modal--input-value-js"
    />
    <btn
      label="create"
      :onClick="onCreateButtonClick"
      class="create-item-modal--button-create-js"
    ></btn>
  </modal>
</template>

<script>
import Btn from "@/components/Btn.vue";
import { mapActions } from "vuex";

export default {
  name: "CreateItemModal",
  components: { Btn },
  data() {
    return {
      item: { key: "", value: "" },
    };
  },
  methods: {
    ...mapActions(["addItem"]),
    onCreateButtonClick() {
      this.addItem(this.item);
      this.$modal.hide("create-item-modal");
      this.item = {};
    },
  },
};
</script>
