<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useCurrentUserStore } from '@/stores/currentUser.js'

const store = useCurrentUserStore()

const showModal = ref(false)
function handleShowModal(e) {
  e.preventDefault()
  e.stopPropagation()
  showModal.value = true
}

function handleClose() {
  showModal.value = false
}

const signUpForm = ref({
  user: {
    email: '',
    handle: '',
    password: '',
  },
})

async function handleSignUp() {
  try {
    const response = await fetch('/api/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(signUpForm.value),
    })
    const data = await response.json()
    console.log('response data:', data)
    await createSession(data)
  } catch (e) {
    console.log('Unexpected server error:', e)
  }
}

const router = useRouter()
function redirectToHome() {
  router.push('/')
}

const logInForm = ref({
  user: {
    email: '',
    password: '',
  },
})

function handleLogin(e) {
  e.preventDefault()
  e.stopPropagation()
  createSession(logInForm.value)
}
async function createSession(loginData) {
  try {
    const response = await fetch('/api/sessions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(loginData),
    })
    if (response.ok) {
      const data = await response.json()
      store.setCurrentUser(data.user)
      redirectToHome()
    } else {
      console.log('response data:', await response.json())
    }
  } catch (e) {
    console.log('Unexpected server error:', e)
  }
}
</script>

<template>
  <div class="h-svh items-center justify-around sm:flex">
    <div>
      <h1 class="text font-serif text-4xl">Eventful</h1>
      <p>Capture the essence of now</p>
    </div>
    <div class="rounded bg-base-100 p-4 shadow-md sm:w-1/3">
      <form method="get">
        <ev-input-field
          v-model="logInForm.user.email"
          id="login-email"
          placeholder="Email"
        />
        <ev-input-field
          v-model="logInForm.user.password"
          id="login-password"
          type="password"
          placeholder="Password"
        />
        <div class="flex flex-col">
          <ev-btn
            class="mb-2"
            @click="handleLogin"
          >
            Log In</ev-btn
          >
          <ev-btn @click="handleShowModal">Sign up</ev-btn>
        </div>
      </form>
    </div>
  </div>
  <div>
    <ev-modal
      v-model:show="showModal"
      confirm-text="Sign up"
      @confirm="handleSignUp"
      @close="handleClose"
    >
      <template #title>
        <h3 class="font-serif text-2xl">Sign up</h3>
      </template>
      <template #body>
        <ev-input-field
          v-model="signUpForm.user.email"
          label="Email"
          autocomplete="off"
        />
        <ev-input-field
          v-model="signUpForm.user.handle"
          label="Handle"
          autocomplete="off"
        />
        <ev-input-field
          v-model="signUpForm.user.password"
          label="Password"
          type="password"
          autocomplete="new-password"
        />
      </template>
    </ev-modal>
  </div>
</template>

<style></style>
