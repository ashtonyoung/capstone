<script setup>
import EvModal from '@/components/generic/EvModal.vue'
import EvInputField from '@/components/generic/EvInputField.vue'
import { ref, reactive } from 'vue'

const showModal = ref(false)
const form = reactive({
  user: {
    email: '',
    handle: '',
    password: '',
  },
})

async function handleSignUp() {
  const response = await fetch('/api/users', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(form),
  })
  const data = await response.json()
  console.log('response data:', data)
}
</script>

<template>
  <div>
    <h1>Log in</h1>
    <form method="get">
      <label for="email">Email</label>
      <!-- TODO Refactor with Ev Components -->
      <input
        type="text"
        id="email"
        name="email"
      />
      <label for="password">Password</label>
      <input
        type="password"
        id="password"
        name="password"
      />
      <input
        type="submit"
        value="Log in"
      />
    </form>
    <button @click="showModal = true">Sign Up</button>
  </div>
  <div>
    <!--    <SignUp />-->
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
            v-model="form.user.email"
            label="Email"
          />
          <ev-input-field
            v-model="form.user.handle"
            label="Handle"
          />
          <ev-input-field
            v-model="form.user.password"
            label="Password"
            type="password"
          />
        </form>
      </template>
    </ev-modal>
  </div>
</template>
