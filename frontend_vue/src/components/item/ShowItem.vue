<template>
  <div>
    <h1>Show item</h1>
    <div class="show-item__label-js">
      key: {{ item.key }}, value: {{ item.value }}
    </div>
    <btn
      :dataId="item.key"
      label="remove"
      :onClick="onRemoveButtonClick"
      class="show-item---button-remove-js"
    ></btn>
    <btn
      :dataId="item.key"
      label="copy"
      :onClick="onCopyButtonClick"
      class="show-item---button-copy-js"
    ></btn>
  </div>
</template>

<script>
import Btn from "@/components/Btn.vue";
import { mapActions } from "vuex";

export default {
  name: "ShowItem",
  props: {
    item: { type: Object, required: true },
  },
  components: { Btn },
  methods: {
    ...mapActions(["removeItem"]),

    onRemoveButtonClick() {
      this.removeItem(this.item);
    },
    onCopyButtonClick() {
      this.$copyText(this.item.value).then(() => {
        alert("Copied");
      });
    },
  },
};
</script>
