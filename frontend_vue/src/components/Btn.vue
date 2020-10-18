<template>
  <button @click="onClick" :dataId="dataId">{{ label }}</button>
</template>

<script>
export default {
  name: "Btn",
  props: {
    label: {
      type: String,
      required: true,
    },

    onClick: {
      type: Function,
      required: false,
      default: () => {},
    },

    dataId: String,
  },
};
</script>
