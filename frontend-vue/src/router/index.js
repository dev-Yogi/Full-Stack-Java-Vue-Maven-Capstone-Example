import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

  const routes = [
  {path: '/', name: 'Home', component: Home},

  {
    path: '/client',
    name: 'Client',
    component: () => import('../views/AddClient.vue')
  },

  { path: '/clients',
    name: 'Clients',
    // route level code-splitting
    // this generates a separate chunk (clients.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "clients" */ '../views/Clients.vue')},

  {path: '/client/:id', name:'ClientDetail', component: () => import('../views/ClientDetail.vue')},
  {path: '/projects', name: 'Projects', component: () => import('../views/Projects.vue')},
  {path: '/project/add', name: 'AddProject', component: () => import('../views/AddProject.vue')},
  {path: '/project/:id', name: 'Project', component: () => import('../views/ProjectDetail.vue')},
  {path: '/projectsgallery', name: 'ProjectsGallery', component: () => import('../views/ProjectsGallery.vue')},

  {path: '/expenses', name:'Expenses', component: () => import('../views/Expenses.vue')},
  {path: '/revenues', name:'Revenues', component: () => import('../views/Revenues.vue')},
  {path: '/ledger', name:'Business Ledger', component: () => import('../views/BusinessLedger.vue')},
  {path: '/expense', name:'Add Expense', component: () => import('../views/AddExpense.vue')},
  {path: '/revenue', name:'Add Revenue', component: () => import('../views/AddRevenue.vue')},
  {path: '/settings', name:'Settings', component: () => import('../views/Settings.vue')},
  {path: '/userprofile', name:'Profile', component: () => import('../views/Settings.vue')},
  {path: '/rates', name:'Rates', component: () => import('../views/Rates.vue')},
  {path: '/markup', name:'Markup', component: () => import('../views/Markup.vue')},
  {path: '/display', name:'Display', component: () => import('../views/Display.vue')},
  {path: '/woodprices', name:'Wood Prices', component: () => import('../views/WoodPrices.vue')}
]

const router = new VueRouter({
  routes
})

export default router
