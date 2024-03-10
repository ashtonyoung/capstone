<script setup>
import { computed, ref } from 'vue'
import { useRoute, RouterLink } from 'vue-router'
import { useFetch, formatTimeAgo } from '@vueuse/core'
// import EvToast from '@/components/generic/EvToast.vue'
import IndexTable from '@/components/IndexTable.vue'

const route = useRoute()
const baseUrl = `/${route.params.handle}/events`
const apiUrl = `/api/${baseUrl}`

const timeAgo = (dateString) => formatTimeAgo(new Date(dateString))

async function handleNewEvent() {
  postEvents.value = useFetch(apiUrl, {
    afterFetch(ctx) {
      if (ctx.error) {
        // form validation should be its own thing
        // this should just be for an unexpected backend error
        console.log('context error:', ctx.error)
      } else {
        handleCloseModal()
        getEvents.value.execute()
      }
    },
  })
    .post(newEvent)
    .json()
}

const newEvent = ref({
  event: {
    name: '',
    description: '',
    start_date: '',
  },
})

const getEvents = ref({})
const postEvents = ref({})

getEvents.value = useFetch(apiUrl).get().json()

const editable = computed(() => getEvents.value.data?.metadata?.for_current_user)

const showModal = ref(false)
function handleShowModal() {
  showModal.value = true
}

function handleCloseModal() {
  showModal.value = false
}
</script>

<template>
  <!--  TABLE  -->
  <div v-if="getEvents.error">
    An unexpected error has occurred: {{ getEvents.statusCode }} {{ getEvents.error }}
  </div>
  <index-table
    v-else
    title="Events"
    primary-button-text="New event"
    :loading="getEvents?.isFetching"
    :editable="editable"
    :items="getEvents?.data?.events"
    @primary-action="handleShowModal"
  >
    <template #items>
      <div
        v-for="(record, index) in getEvents.data.events"
        :key="index"
      >
        <RouterLink :to="`${baseUrl}/${record.id}/chapters`">
          <div class="border-neutral-content flex w-full bg-base-100 p-2 shadow hover:bg-base-200">
            <div class="flex w-full flex-row items-center">
              <p class="font-serif text-xl">{{ record.name }}</p>
              <p class="text-neutral-content absolute right-10 text-xs">
                {{ timeAgo(record.start_date) }}
              </p>
            </div>
          </div>
        </RouterLink>
      </div>
    </template>
  </index-table>
  <ev-modal
    v-model:show="showModal"
    :loading="postEvents.isFetching"
    @confirm="handleNewEvent"
    @close="handleCloseModal"
  >
    <template #title>
      <h3 class="font-serif text-2xl">New event</h3>
    </template>
    <template #body>
      <div>
        <ev-input-field
          v-model="newEvent.event.name"
          label="Name"
          autocomplete="off"
        />
        <ev-input-field
          v-model="newEvent.event.description"
          label="Description"
          autocomplete="off"
        />
        <ev-input-field
          v-model="newEvent.event.start_date"
          label="Start date"
          type="date"
        />
      </div>
    </template>
  </ev-modal>
  <!--  <ev-toast-->
  <!--    title="Error"-->
  <!--    :message="postEvents.error"-->
  <!--    v-model:show="postEvents.error"-->
  <!--  ></ev-toast>-->
</template>
