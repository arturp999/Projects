import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        count: 0,
        shopItems: [],
        user: {
            loggedIn: false,
            data: null
        }
    },
    mutations: {
        getLocalItems(state) {
            // console.log(localStorage.getItem("shopItems"))
            var items = JSON.parse(localStorage.getItem("shopItems"));
            if (items == null) {
                items = [];
                localStorage.setItem("shopItems", JSON.stringify(items));
            }
            state.shopItems = items;
        },
        empty(state) {
            state.shopItems = [];
            state.count = 0;
            localStorage.setItem("shopItems", JSON.stringify(state.shopItems));
        },
        increment(state) {
            state.count++;
            localStorage.setItem("shopItems", JSON.stringify(state.shopItems));
        },
        add(state, item) {
            state.shopItems.push(item);
            localStorage.setItem("shopItems", JSON.stringify(state.shopItems));
        },
        remove(state, index) {
            this.state.shopItems.splice(index, 1);
            localStorage.setItem("shopItems", JSON.stringify(state.shopItems));
        },
        SET_LOGGED_IN(state, value) {
            state.user.loggedIn = value;
        },
        SET_USER(state, data) {
            state.user.data = data;
        }
    },
    actions: {
        emptyCart({ commit }) {
            commit('empty');
        },
        addtoShopitems({ commit }, dog) {
            return new Promise((resolve, object) => {
                var found = false;
                this.state.shopItems.forEach(element => {
                    if (element.Id == dog.Id) {
                        found = true;
                        element.Quantity += 1;
                    }
                });
                localStorage.setItem("shopItems", JSON.stringify(this.state.shopItems));
                if (!found) {
                    commit('add', dog)
                }
            })
        },
        removeShopitems({ commit }, dog) {
            return new Promise((resolve, object) => {
                for (var i = 0; i < this.state.shopItems.length; i++) {
                    if (this.state.shopItems[i].Id == dog.Id) {
                        if (this.state.shopItems[i].Quantity > 1) {
                            this.state.shopItems[i].Quantity -= 1;
                            break;
                        } else {
                            commit('remove', i)
                            break;
                        }

                    }
                }
            })
        },
        fetchUser({ commit }, user) {
            commit("SET_LOGGED_IN", user !== null); //123456@gmail.com 123456
            console.log(user.uid)
            if (user) {
                commit("SET_USER", {
                    displayName: user.displayName,
                    email: user.email,
                    uid: user.uid
                });
            } else {
                commit("SET_USER", null);
            }
        }
    },
    getters: {
        getshopItems: state => {
            return state.shopItems;
        },
        user(state) {
            return state.user
        },
        status: state => state.user.loggedIn
    }
})