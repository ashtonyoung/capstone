<script setup>
import { defineModel, defineProps, defineEmits } from 'vue'
const emit = defineEmits(['confirm'])
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

function handleConfirm(event) {
  event.preventDefault()
  event.stopPropagation()
  emit('confirm')
}

function handleCancel() {
  show.value = false
}

function handleClose() {
  show.value = false
}
</script>

<template>
  <div>
    <div
      class="flex"
      id="modal-title-container"
    >
      <h3>
        <slot name="title"></slot>
      </h3>
      <button @click="handleClose"><i>x</i></button>
    </div>

    <div id="modal-content-container">
      <slot name="body"></slot>
    </div>
    <div id="modal-footer-container">
      <slot name="footer">
        <button @click="handleCancel">{{ cancelText }}</button>
        <button @click="handleConfirm">{{ confirmText }}</button>
      </slot>
    </div>
  </div>
</template>

<style scoped>
#modal-title-container {
  padding: 1rem;
}

/* TODO remember how to do flexbox lol */
/* .flex > h3 {
  align-self: start;
}
.flex > button {
  align-self: end;
} */
</style>
