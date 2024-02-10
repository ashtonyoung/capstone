<script setup>
import { defineModel } from 'vue'

const props = defineProps({
  label: String,
  id: String,
  placeholder: String,
  type: {
    default: 'text',
    type: String,
  },
})

const model = defineModel()
</script>

<template>
  <div class="mb-2 flex flex-col">
    <label
      v-if="props.label"
      :for="props.label"
      >{{ props.label }}</label
    >
    <input
      class="rounded border p-2"
      :type="props.type"
      :name="props.label"
      :id="props.label"
      :placeholder="props.placeholder"
      v-model="model"
    />
  </div>
</template>
