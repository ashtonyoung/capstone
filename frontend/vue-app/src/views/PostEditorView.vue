<script setup>
import TipTap from '@/components/TipTap.vue'
import { ref } from 'vue'

const editorHTML = ref('')

function handleSaveHTML(html) {
  editorHTML.value = html
  console.log(editorHTML.value)
}
</script>

<template>
  <div id="editor">
    <tip-tap @save="handleSaveHTML" />
  </div>
</template>
