<script setup>
import { useFetch } from '@vueuse/core'
import { ref, computed, defineProps, defineEmits } from 'vue'

const props = defineProps({
  modelSingular: String,
  modelPlural: String,
  itemBaseUrl: String,
})

const emit = defineEmits(['modalConfirm'])

const { isFetching, error, data } = useFetch(`/api/${props.itemBaseUrl}`).get().json()

const editable = computed(() => data?.value?.metadata?.for_current_user)

// Modal
const showModal = ref(false)
function handleShowModal(e) {
  e.preventDefault()
  e.stopPropagation()
  showModal.value = true
}
function handleClose() {
  showModal.value = false
}
function handleConfirm() {
  emit('modalConfirm')
}
</script>

<template>
  <div>
    <header class="my-2 flex items-center justify-between">
      <div class="text-xl capitalize">{{ props.modelPlural }}</div>
      <ev-btn
        v-if="editable"
        @click="handleShowModal"
        >New {{ props.modelSingular }}</ev-btn
      >
    </header>
    <main class="h-svh w-full">
      <div v-if="data">
        <div v-if="data[props.modelPlural]?.length">
          <div
            v-for="record of data[props.modelPlural]"
            v-bind:key="record.id"
            class="flex w-full rounded bg-base-100 p-2 shadow"
          >
            <!-- SLOT-->
            <a :href="`/${props.itemBaseUrl}/${record.id}`">
              <p class="font-serif text-xl">{{ record.name }}</p>
              <p class="text-neutral-content text-xs">{{ record.start_date }}</p>
            </a>
          </div>
        </div>
        <div v-else>No {{ props.modelPlural }} created yet</div>
      </div>
      <div v-else-if="isFetching">Fetching data...</div>
      <div v-else>An unexpected error occurred: {{ error }}</div>
    </main>
  </div>
  <ev-modal
    v-if="editable"
    v-model:show="showModal"
    @close="handleClose"
    @confirm="handleConfirm"
  >
  </ev-modal>
</template>
