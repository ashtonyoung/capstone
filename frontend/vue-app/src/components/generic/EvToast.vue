<script setup>
import { defineModel } from 'vue'

const show = defineModel('show', { required: true })
const props = defineProps({
  title: {
    type: String,
    default: 'Toast Title',
  },
  message: {
    type: String,
    default: 'This is a placeholder toast message',
  },
})
</script>

<template>
  <div
    v-if="show"
    class="fixed bottom-8 right-8 h-16 w-64 rounded bg-error shadow-lg"
  >
    <div class="text-error-content m-2">
      <h3 class="text-lg font-bold">{{ props.title }}</h3>
      <p class="text-sm">{{ props.message }}</p>
    </div>
  </div>
</template>
