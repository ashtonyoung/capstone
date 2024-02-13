import { ref } from 'vue'
import { defineStore } from 'pinia'

export const useCurrentUserStore = defineStore('currentUser', () => {
  const currentUser = ref(null)
  function setCurrentUser(user) {
    currentUser.value = user
  }
  function clearCurrentUser() {
    currentUser.value = null
  }

  return { currentUser, setCurrentUser, clearCurrentUser }
})
