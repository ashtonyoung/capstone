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
  <div class="container">
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
@import '@/assets/base.scss';

.container {
  display: flex;
  flex-direction: column;
}

label {
  font-weight: 500;
  color: $primary;
}

input {
  padding: 0.5rem;
  font-size: 16px;
  border: 1px solid $gray;
  border-radius: $br;
}

input:focus {
  border: 1px solid $secondary;
}
</style>
