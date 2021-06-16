<template>
  <v-app id="inspire">
    <header>
      <v-layout id="mobileDesaparece">
        <v-row no-gutters class="d-flex justify-end pt-4 pl-12 pr-12 logoEmpresa" row-height="40px">
          <div class="flex">
            <router-link to="/">
              <img height="70px" src="https://i.imgur.com/qyMDJ4F.png" />
            </router-link>
          </div>

          <router-link to="/">
            <v-bottom-navigation grow>
              <v-btn icon x-large>
                <span>Home</span>
                <v-icon>mdi-home</v-icon>
              </v-btn>
            </v-bottom-navigation>
          </router-link>

          <router-link v-if="user.loggedIn" to="/market">
            <cart></cart>
          </router-link>

          <router-link to="/search">
            <v-bottom-navigation grow>
              <v-btn icon x-large>
                <span>Search</span>
                <v-icon>mdi-magnify</v-icon>
              </v-btn>
            </v-bottom-navigation>
          </router-link>

          <router-link to="/">
            <v-bottom-navigation grow>
              <v-btn v-if="user.loggedIn" @click.prevent="signOut" icon x-large>
                <span>Logout</span>
                <v-icon>mdi-account-arrow-left</v-icon>
              </v-btn>
            </v-bottom-navigation>
          </router-link>

          <v-dialog v-if="popLoggedout" v-model="popLoggedout" overlay-color="black">
            <v-btn tile large dense border="left" color="success">
              <strong>You have successfully logged out!</strong>
            </v-btn>
          </v-dialog>

          <login></login>

          <router-link v-if="!user.loggedIn" to="/contact">
            <v-bottom-navigation grow>
              <v-btn icon x-large>
                <span>Register</span>
                <img
                  src="https://img.pngio.com/png-avatar-108-images-in-collection-page-3-png-avatar-300_300.png"
                  height="35px"
                />
              </v-btn>
            </v-bottom-navigation>
          </router-link>
        </v-row>
      </v-layout>

      <v-layout id="mobileOnly">
        <v-navigation-drawer v-model="drawer" app>
          <v-list dense>
            <v-list-item link v-if="user.loggedIn">
              <v-list-item-content>
                <v-list-item-title class="title">{{user.data.displayName}}</v-list-item-title>
                <v-list-item-subtitle>{{user.data.email}}</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>

            <router-link v-if="!user.loggedIn" to="/contact">
              <v-list-item>
                <v-btn icon x-large>
                  <v-avatar size="48">
                    <img
                      src="https://img.pngio.com/png-avatar-108-images-in-collection-page-3-png-avatar-300_300.png"
                    />
                  </v-avatar>
                </v-btn>
                <v-list-item-title class="ml-2">Register</v-list-item-title>
              </v-list-item>
            </router-link>
          </v-list>

          <v-divider></v-divider>
          <router-link to="/">
            <v-list-item link>
              <v-btn icon x-large>
                <v-icon>mdi-home</v-icon>
              </v-btn>
              <v-list-item-title>Home</v-list-item-title>
            </v-list-item>
          </router-link>

          <v-list nav dense>
            <router-link to="/login">
            <v-list-item link v-if="!user.loggedIn">
              <v-btn icon x-large>
                <v-icon>mdi-account-arrow-right</v-icon>
              </v-btn>
              <v-list-item-title class="ml-2">Login</v-list-item-title>
            </v-list-item>
            </router-link>

            <router-link to="/search">
              <v-list-item link>
                <v-btn icon x-large>
                  <v-icon>mdi-magnify</v-icon>
                </v-btn>
                <v-list-item-title>Search</v-list-item-title>
              </v-list-item>
            </router-link>

            <router-link v-if="user.loggedIn" to="/market">
              <v-list-item link>
                <v-btn icon x-large>
                  <v-icon>mdi-cart-outline</v-icon>
                </v-btn>
                <v-list-item-title>My Cart</v-list-item-title>
              </v-list-item>
            </router-link>

            <router-link to="/">
              <v-list-item v-if="user.loggedIn" @click.prevent="signOut" link>
                <v-btn icon x-large>
                  <v-icon>mdi-account-arrow-left</v-icon>
                </v-btn>
                <v-list-item-title>Logout</v-list-item-title>
              </v-list-item>
            </router-link>
          </v-list>
        </v-navigation-drawer>

        <v-app-bar app dark>
          <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
          <router-link v-if="user.loggedIn" to="/market">
            <v-list-item link>
              <cart></cart>
            </v-list-item>
          </router-link>

          <v-img contain width="55px" height="55px" src="https://i.imgur.com/qyMDJ4F.png" />
        </v-app-bar>
      </v-layout>
    </header>

    <v-content>
      <transition name="fade">
        <router-view />
      </transition>
    </v-content>

    <v-footer>
      <v-spacer></v-spacer>
      <div class="white--text">&copy; Universidade da Madeira</div>
      <v-spacer></v-spacer>
    </v-footer>
  </v-app>
</template>
<script>
import cart from "@/components/ComponentesCustom/cart.vue";
import login from "@/components/Authen/login.vue";
import firebase from "firebase";
import { mapGetters } from "vuex";

export default {
  name: "App",
  data() {
    return {
      shoppingCartitems: [],
      popLoggedout: false,
      drawer: null
    };
  },
  components: {
    cart, //importando o componente que vai ser usado
    login
  },
  created() {
    this.$vuetify.theme.dark = true;
  },
  computed: {
    ...mapGetters({
      user: "user",
      displayName: ""
    })
  },
  methods: {
    signOut() {
      firebase
        .auth()
        .signOut()
        .then(data => {
          this.$router.push({ path: "/" });
          this.popLoggedout = true;
        });
    }
  }
};
</script>

<style scoped>
a {
  text-decoration: none;
}
.logoEmpresa {
  background: #272929;
}
main {
  padding: 20px 20px 20px 20px !important;
}
.v-item-group.v-bottom-navigation {
  box-shadow: 0px 0px 0px 0px;
  background: #272929;
}

/* Media Queries */

@media screen and (max-width: 600px) {
  #mobileDesaparece {
    display: none;
  }
}

@media screen and (min-width: 600px) {
  #mobileOnly {
    display: none;
  }
}
</style>