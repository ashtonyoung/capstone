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

<!-- Global Style -->
<style>
:root {
  --primary: #1e90ff;
  --secondary: #9e90ff;
}

body {
  //font-family: 'Roboto Slab', serif;
  font-family: 'Inter', serif;
}

/* UTILITY CLASSES */

.flex {
  display: flex;
}
</style>
