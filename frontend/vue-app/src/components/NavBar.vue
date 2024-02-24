<script setup>
import { RouterLink } from 'vue-router'
import { useCurrentUserStore } from '@/stores/currentUser.js'
import { storeToRefs } from 'pinia'
import { Bars3Icon, UserCircleIcon } from '@heroicons/vue/24/solid'
import { ref } from 'vue'

const store = useCurrentUserStore()
const { currentUser } = storeToRefs(store)

const showLeftNav = ref(false)
const showRightNav = ref(false)
function toggleLeftNav() {
  showLeftNav.value = !showLeftNav.value
  if (showRightNav.value === true) {
    showRightNav.value = false
  }
}
function toggleRightNav() {
  showRightNav.value = !showRightNav.value
  if (showLeftNav.value === true) {
    showLeftNav.value = false
  }
}
</script>

<template>
  <nav
    v-if="store.userLoggedIn()"
    class="flex h-16 items-center justify-between bg-base-100 font-bold"
  >
    <section class="mx-4 flex items-center">
      <button @click="toggleLeftNav">
        <Bars3Icon class="h-6" />
      </button>
      <!--      <h1 class="text-primary-content mx-2 w-full bg-secondary p-2 font-serif">E</h1>-->
      <h1 class="mx-2">Home > Model > Action</h1>
    </section>
    <section class="mx-4">
      <button @click="toggleRightNav">
        <UserCircleIcon class="h-6" />
      </button>
    </section>
  </nav>
  <nav
    v-else
    class="z-40 flex h-16 items-center justify-between bg-base-100 font-bold"
  >
    <section class="mx-4">
      <RouterLink to="/about">Eventful</RouterLink>
    </section>
    <section class="mx-4">
      <RouterLink to="/login">Sign in</RouterLink>
    </section>
  </nav>
  <Transition name="slide-left">
    <aside
      v-if="showLeftNav"
      id="left-nav"
      class="absolute left-0 top-16 z-10 m-0 h-1/2 w-full rounded-r bg-base-100 shadow-2xl sm:h-svh sm:w-64"
    >
      <div class="mx-4 mt-4">
        <section class="flex flex-col border-b border-base-content py-2">
          <RouterLink to="/editor">New Post</RouterLink>
        </section>
        <section class="flex flex-col py-2">
          <RouterLink :to="`${currentUser.handle}/chapters`">Chapters</RouterLink>
          <RouterLink :to="`${currentUser.handle}/posts`">Posts</RouterLink>
          <RouterLink :to="`${currentUser.handle}/goals`">Goals</RouterLink>
        </section>
      </div>
    </aside>
  </Transition>
  <Transition name="slide-right">
    <aside
      v-if="showRightNav"
      id="right-nav"
      class="absolute right-0 top-16 z-10 m-0 h-1/2 w-full rounded-l bg-base-100 shadow-2xl sm:h-svh sm:w-64"
    >
      <div class="mx-4 mt-4">
        <!-- TODO: refactor using some kind of card component -->
        <section class="flex flex-col border-b border-base-content py-2">
          <RouterLink :to="`${currentUser.handle}`">
            <div class="flex">
              <UserCircleIcon class="h-6" />
              <p class="ml-2">{{ currentUser.handle }}</p>
            </div>
          </RouterLink>
        </section>
        <section class="flex flex-col py-2">
          <RouterLink to="/logout">Log out</RouterLink>
        </section>
      </div>
    </aside>
  </Transition>
</template>

<style scoped>
/* only animate if above sm media query size */
@media (min-width: 640px) {
  .slide-left-enter-active,
  .slide-left-leave-active {
    transition: all 0.3s ease;
  }

  .slide-left-enter-from,
  .slide-left-leave-to {
    transform: translateX(-300px);
  }

  .slide-right-enter-active,
  .slide-right-leave-active {
    transition: all 0.3s ease;
  }

  .slide-right-enter-from,
  .slide-right-leave-to {
    transform: translateX(300px);
  }
}
</style>
