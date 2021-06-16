import Vue from 'vue';
import './plugins/axios';
import App from './App.vue';
import router from './router';
import vuetify from './plugins/vuetify';
import store from './store/store.js';
import * as firebase from "firebase";


// var user = firebase.auth().currentUser;

Vue.config.productionTip = false

const firebaseConfig = {
    apiKey: "AIzaSyC0Fv3F-VWCEXmS6NUM8obra42nJEdb_xU",
    authDomain: "frontend-uma.firebaseapp.com",
    databaseURL: "https://frontend-uma.firebaseio.com",
    projectId: "frontend-uma",
    appId: "1:1060716162002:web:3b8a57ca699a93ada9f60b",
    measurementId: "G-ENHWT2EGM8"
};

firebase.initializeApp(firebaseConfig);
firebase.auth().onAuthStateChanged(user => {
    store.dispatch("fetchUser", user);
});


new Vue({
    router,
    store,
    vuetify,
    beforeCreate() { this.$store.commit("getLocalItems") },
    render: function(h) { return h(App) }
}).$mount('#app')