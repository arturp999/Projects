import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store/store';

//Minhas paginas de componentes
import Home from '../components/Home/home.vue';
import Contact from '../components/Contact/contact.vue';
import Market from '../components/Market/market.vue';
import Search from '../components/Search/search.vue';
import Login from '../components/Authen/login.vue';
import Dashboard from '../components/Home/dashboard.vue';
import Default from '../components/Default/default.vue';
import DynamicBreed from '../components/DynamicBreed/breed.vue';

Vue.use(VueRouter)

const routes = [{
        path: '/',
        name: 'homePage',
        component: Home
    },
    {
        path: '/Dashboard',
        name: 'dashboardPage',
        component: Dashboard
    },
    {
        path: '/Contact',
        name: 'contactPage',
        component: Contact
    },
    {
        path: '/market',
        name: 'market',
        component: Market,
        meta: { requiresAuth: true }
    },
    {
        path: '/search',
        name: 'search',
        component: Search
    },
    {
        path: '/login',
        nome: 'login',
        component: Login
    },
    {
        path: '/breed/:name',
        nome: 'breed',
        component: DynamicBreed
    },
    {
        path: '*',
        nome: 'default',
        component: Default
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

import * as firebase from "firebase";
export default router

router.beforeEach((to, from, next) => {
    const currentUser = firebase.auth().currentUser;
    const requiresAuth = to.matched.some(record => record.meta.requiresAuth);

    if (requiresAuth && !currentUser)
        next('login');
    else if (!requiresAuth && currentUser)
        next();
    else
        next();
});