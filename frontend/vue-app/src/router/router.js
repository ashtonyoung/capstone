import { createRouter, createWebHistory } from 'vue-router'
import { checkAuthentication } from '@/router/sessionFunctions.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      meta: { public: true },
      component: () => import('@/views/HomeView.vue'),
    },
    {
      path: '/login',
      name: 'login',
      meta: { public: true },
      beforeEnter: async (to, from, next) => {
        if (await checkAuthentication()) {
          next('/')
          return
        }
        next()
      },
      component: () => import('@/views/LogInView.vue'),
    },
    {
      path: '/editor',
      name: 'editor',
      component: () => import('@/views/PostEditorView.vue'),
    },
    {
      path: '/about',
      name: 'about',
      meta: { public: true },
      component: () => import('@/views/AboutView.vue'),
    },
    {
      path: '/:handle',
      name: 'user-profile',
      component: () => import('@/views/UserProfileView.vue'),
    },
    {
      path: '/:handle/events',
      name: 'events',
      meta: { public: true },
      component: () => import('@/views/EventIndexView.vue'),
    },
    {
      path: '/:handle/events/:event_id/chapters',
      name: 'chapters',
      component: () => import('@/views/ChapterIndexView.vue'),
    },
    {
      path: '/:handle/posts',
      name: 'posts',
      component: () => import('@/views/PostIndexView.vue'),
    },
    {
      path: '/:handle/goals',
      name: 'goals',
      component: () => import('@/views/GoalIndexView.vue'),
    },
    {
      path: '/logout',
      name: 'logout',
      component: () => import('@/views/LogoutView.vue'),
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      meta: { public: true },
      component: () => import('@/views/NotFoundView.vue'),
    },
  ],
})

// Add a global beforeEach guard to adhere to secure by default principles
router.beforeEach(async (to, from, next) => {
  if (!to.matched.some((record) => record?.meta?.public)) {
    const isAuthenticated = await checkAuthentication()
    if (isAuthenticated) {
      next()
    } else {
      next('/login')
    }
  } else {
    next()
  }
})

router.resolve({
  name: 'not-found',
  params: { pathMatch: ['not', 'found'] },
})

export default router
