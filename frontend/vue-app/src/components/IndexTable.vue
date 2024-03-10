<script setup>
import { defineProps, defineEmits, computed } from 'vue'
import { InboxIcon } from '@heroicons/vue/24/outline/index.js'

const props = defineProps({
  title: String,
  primaryButtonText: String,
  loading: Boolean,
  editable: Boolean,
  items: {
    type: Array,
    default: () => [],
  },
})

const dataNotEmpty = computed(() => props.items?.length)

const emit = defineEmits(['primaryAction'])
function handlePrimaryButton() {
  emit('primaryAction')
}
</script>

<template>
  <div>
    <header class="my-2 flex items-center justify-between">
      <div class="flex flex-col">
        <div class="font-serif text-2xl capitalize">{{ props.title }}</div>
      </div>
      <ev-btn
        v-if="props.editable"
        @click="handlePrimaryButton"
      >
        {{ props.primaryButtonText }}
      </ev-btn>
    </header>
    <main class="h-svh w-full">
      <div v-if="props.loading">Fetching data...</div>
      <div v-else>
        <div v-if="dataNotEmpty">
          <slot name="items"></slot>
        </div>
        <div
          v-else
          class="flex flex-col items-center rounded bg-base-300 p-12"
        >
          <p class="text-xl font-bold">No items found</p>
          <InboxIcon class="h-12" />
        </div>
      </div>
    </main>
  </div>
</template>
