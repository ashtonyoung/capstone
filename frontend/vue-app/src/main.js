import './style.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router/router.js'

// Ev Components
import EvModal from '@/components/generic/EvModal.vue'
import EvInputField from '@/components/generic/EvInputField.vue'
import EvBtn from '@/components/generic/EvBtn.vue'

const pinia = createPinia()
const app = createApp(App)

//register components
app.component('ev-modal', EvModal)
app.component('ev-input-field', EvInputField)
app.component('ev-btn', EvBtn)

app.use(pinia)
app.use(router)

app.mount('#app')
