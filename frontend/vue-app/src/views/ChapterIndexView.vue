<script setup>
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import IndexTable from '@/components/IndexTable.vue'

const route = useRoute()
const url = ref(`${route.params.handle}/events/${route.params.event_id}/chapters`)
</script>

<template>
  <index-table
    model-singular="chapter"
    model-plural="chapters"
    model-contains="posts"
    :item-base-url="url"
  />
</template>
