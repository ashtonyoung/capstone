<script setup>
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import IndexTable from '@/components/IndexTable.vue'

const route = useRoute()
const url = ref(`${route.params.handle}/events`)
</script>

<template>
  <index-table
    model-singular="event"
    model-plural="events"
    :item-base-url="url"
  />
</template>
