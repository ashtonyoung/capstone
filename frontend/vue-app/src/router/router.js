import { createRouter, createWebHistory } from 'vue-router'
import { checkAuthentication, logout } from '@/router/sessionFunctions.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomeView.vue'),
    },
    {
      path: '/login',
      name: 'login',
      meta: { public: true },
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
      component: () => import('@/views/AboutView.vue'),
    },
    {
      path: '/logout',
      name: 'logout',
      beforeEnter: async (to, from, next) => {
        await logout()
        next('/login') // Redirect to the login page after logout
      },
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
