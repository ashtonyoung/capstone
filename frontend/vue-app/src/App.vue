<script setup>
import { RouterView } from 'vue-router'
import NavBar from '@/components/NavBar.vue'
</script>

<template>
  <header></header>

  <NavBar v-if="$route.path !== '/login'" />
  <!--  Don't want global margins on Nav  -->
  <section
    id="router-view-container"
    class="mx-2 sm:mx-4"
  >
    <RouterView />
  </section>
</template>

<style>
/* CSS debugging */
/*
.sm\:flex {
  outline: 1px solid red;
}

.sm\:flex > * {
  outline: 1px solid rebeccapurple !important;
}
 */
</style>
