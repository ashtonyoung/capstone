<script setup>
import EvModal from '@/components/generic/EvModal.vue'
import EvInputField from '@/components/generic/EvInputField.vue'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const showModal = ref(false)
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
  <h1>Eventful</h1>
  <div>
    <h2>Log in</h2>
    <form method="get">
      <ev-input-field
        v-model="logInForm.user.email"
        label="Email"
      />
      <ev-input-field
        v-model="logInForm.user.password"
        label="Password"
        type="password"
      />
      <input
        type="submit"
        value="Log in"
        @click="handleLogIn"
      />
    </form>
    <button @click="showModal = true">Sign Up</button>
  </div>
  <div>
    <ev-modal
      v-if="showModal"
      v-model:show="showModal"
      confirm-text="Sign up"
      @confirm="handleSignUp"
    >
      <template #title>Sign Up</template>
      <template #body>
        <form>
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
        </form>
      </template>
    </ev-modal>
  </div>
</template>
