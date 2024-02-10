<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

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
async function handleLogIn(e) {
  e.preventDefault()
  e.stopPropagation()
  try {
    const response = await fetch('/api/sessions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(logInForm.value),
    })
    if (response.ok) {
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
            @click="handleLogIn"
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
        />
        <ev-input-field
          v-model="signUpForm.user.handle"
          label="Handle"
        />
        <ev-input-field
          v-model="signUpForm.user.password"
          label="Password"
          type="password"
        />
      </template>
    </ev-modal>
  </div>
</template>

<style></style>
