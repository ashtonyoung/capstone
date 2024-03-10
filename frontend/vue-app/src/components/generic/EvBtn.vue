<script setup>
const props = defineProps({
  loading: {
    type: Boolean,
    default: false,
  },
})
</script>

<template>
  <button
    :disabled="props.loading"
    class="text-primary-content disabled:bg-neutral-content rounded bg-primary px-2 py-1"
  >
    <slot></slot>
  </button>
</template>
