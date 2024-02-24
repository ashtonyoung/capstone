import { defineStore } from 'pinia'
import { useStorage } from '@vueuse/core'

export const useCurrentUserStore = defineStore('currentUser', () => {
  const currentUser = useStorage('currentUser', {})
  function setCurrentUser(user) {
    currentUser.value = user
  }
  function clearCurrentUser() {
    currentUser.value = null
  }

  function userLoggedIn() {
    return currentUser.value?.id
  }

  return { currentUser, setCurrentUser, clearCurrentUser, userLoggedIn }
})
