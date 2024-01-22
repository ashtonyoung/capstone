<script setup>
import { defineModel } from 'vue'

defineProps({
  label: {
    default: '',
    type: String,
  },
  placeholder: {
    default: '',
    type: String,
  },
  type: {
    default: 'text',
    type: String,
  },
})

const model = defineModel()
</script>

<template>
  <div>
    <label :for="label">{{ label }}</label>
    <input
      :type="type"
      :name="label"
      :id="label"
      :placeholder="placeholder"
      v-model="model"
    />
  </div>
</template>

<style scoped>
input:focus {
  border: yellow 8px solid;
  background-color: var(--primary);
}
</style>
