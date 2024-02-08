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

function handleClose() {
  emit('close')
}
</script>

<template>
  <dialog ref="dialog">
    <form method="dialog">
      <div
        class="flex"
        id="modal-title-container"
      >
        <h3>
          <slot name="title"></slot>
        </h3>
        <ev-btn @click="handleClose">X</ev-btn>
      </div>

      <div id="modal-content-container">
        <slot name="body"></slot>
      </div>
      <div id="modal-footer-container">
        <slot name="footer">
          <ev-btn @click="handleCancel">{{ cancelText }}</ev-btn>
          <ev-btn @click="handleConfirm">{{ confirmText }}</ev-btn>
        </slot>
      </div>
    </form>
  </dialog>
</template>

<style scoped lang="scss">
@import '@/assets/base.scss';
dialog {
  border-radius: $br;
  border: none;
  justify-content: center;
  align-items: center;
  margin: auto;
  padding: 0;
  width: 66.66%;
  height: 66.66%;
  max-width: 40rem;
  max-height: 30rem;
}

#modal-title-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1.5rem;
  background-color: $primary;

  h3 {
    font-weight: 800;
    margin: 0;
    color: $white;
    font-size: $fs-title;
  }

  button {
    background: none;
    border: none;
    color: $white;
    font-weight: 800;
    font-size: 1rem;
  }
}

#modal-content-container {
  padding: 1.5rem;
}
</style>
