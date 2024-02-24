<script setup>
import { useCurrentUserStore } from '@/stores/currentUser.js'
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { logout } from '@/router/sessionFunctions.js'

const store = useCurrentUserStore()
const router = useRouter()

onMounted(async () => {
  await logout()
  store.clearCurrentUser()
  await router.push('/login')
})
</script>

<template>
  <h1>Logging out...</h1>
</template>
