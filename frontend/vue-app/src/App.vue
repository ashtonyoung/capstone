<script setup>
import { RouterView } from 'vue-router'
import { ref } from 'vue'
import NavBar from './components/NavBar.vue'

const sessionExists = ref(false)
</script>

<template>
  <header>
    <NavBar v-if="sessionExists"></NavBar>
  </header>

  <RouterView />
</template>
