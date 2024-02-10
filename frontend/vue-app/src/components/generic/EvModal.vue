<script setup>
import { defineModel, defineProps, defineEmits, ref, watch } from 'vue'
import EvBtn from '@/components/generic/EvBtn.vue'
const emit = defineEmits(['confirm', 'close'])
defineProps({
  confirmText: {
    type: String,
    default: 'Confirm',
    required: false,
  },
  cancelText: {
    type: String,
    default: 'Cancel',
    required: false,
  },
})
const show = defineModel('show', { required: true })
const dialog = ref(null)
watch(show, async (newValue) => {
  // first check guards against before component mounts
  if (newValue !== null) {
    if (newValue === true) {
      dialog.value.showModal()
    } else if (newValue === false) {
      dialog.value.close()
    }
  }
})
function handleConfirm(event) {
  event.preventDefault()
  event.stopPropagation()
  emit('confirm')
}
function handleCancel() {
  emit('close')
}
</script>

<template>
  <dialog
    class="rounded p-4 text-base-content sm:w-1/2 lg:w-1/3"
    ref="dialog"
  >
    <form method="dialog">
      <header class="mb-2 flex content-between text-xl">
        <slot name="title"></slot>
      </header>

      <section>
        <slot name="body"></slot>
      </section>
      <slot name="footer">
        <footer class="flex flex-row justify-end">
          <ev-btn
            class="mr-1"
            @click="handleCancel"
            >{{ cancelText }}</ev-btn
          >
          <ev-btn @click="handleConfirm">{{ confirmText }}</ev-btn>
        </footer>
      </slot>
    </form>
  </dialog>
</template>
