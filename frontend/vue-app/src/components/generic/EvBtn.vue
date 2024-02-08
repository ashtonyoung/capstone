<script setup>
defineProps({
  type: {
    default: 'primary',
    type: String,
  },
})
</script>

<template>
  <button class="">
    <slot></slot>
  </button>
</template>

<style scoped lang="scss">
@import '@/assets/base.scss';

button {
  background-color: $primary;
  color: $white;
}
</style>
