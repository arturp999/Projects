<template>
  <div class="login mr-2 ml-2">
    <v-row justify="center">
      <v-dialog v-if="!user.loggedIn" v-model="popupLog" persistent max-width="550">
        <template v-slot:activator="{ on }">
          <v-bottom-navigation grow>
            <v-btn icon x-large dark v-on="on">
              <span>Login</span>
              <v-icon>mdi-account-arrow-right</v-icon>
            </v-btn>
          </v-bottom-navigation>
        </template>
        <v-card>
          <v-card-text>
            <h1 class="text-center pa-3">Sign in!</h1>
            <v-form action="#" @submit.prevent="submit" ref="form" v-model="valid" lazy-validation>
              <v-input>
                <v-text-field
                  id="email"
                  class="form-control"
                  name="email"
                  value
                  required
                  v-model="form.email"
                  prepend-icon="mdi-account"
                  :counter="50"
                  :rules="nameRules"
                  label="Email"
                ></v-text-field>
              </v-input>

              <v-input>
                <v-text-field
                  id="password"
                  type="password"
                  class="form-control"
                  name="password"
                  required
                  v-model="form.password"
                  prepend-icon="mdi-key"
                  :rules="passwordRules"
                  label="Password"
                ></v-text-field>
              </v-input>
              <v-alert v-if="erroValidacao" type="error">{{errorloginMsg}}</v-alert>
              <v-checkbox
                v-model="checkbox"
                :rules="[v => !!v || 'You must confirm to continue!']"
                label="Continue ?"
                required
              ></v-checkbox>
              <v-btn color="success" class="mr-4" type="submit" @click="validate">Login</v-btn>
              <v-btn color="warning" class="mr-4" @click="reset">Reset</v-btn>
              <v-btn color="error" @click="reset (popupLog = false)">Cancel</v-btn>
            </v-form>
          </v-card-text>
          <v-card-text class="pl-5 pb-0 pt-0">Dont have an account ? Please register below</v-card-text>
          <v-card-text class="pl-5">
            <v-btn
              depressed
              small
              class="mt-2 blue"
              to="/contact"
              @click="popupLog = false"
            >Register link</v-btn>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>



<script>
import firebase from "firebase";
import { mapGetters } from "vuex";

export default {
  name: "Login",
  data() {
    return {
      form: {
        email: "",
        password: ""
      },
      popupLog: false,
      valid: true,
      name: "",
      errorloginMsg: "",
      erroValidacao: false,
      nameRules: [
        v => !!v || "User is required",
        v => (v && v.length <= 50) || "User must be less than 20 characters"
      ],
      password: "",
      passwordRules: [
        v => !!v || "Password is required",
        v => (v && v.length >= 5) || "Pass must be more than 5 characters"
      ],
      checkbox: "",
      error: null
    };
  },
  methods: {
    validate() {
      this.$refs.form.validate();
    },
    reset() {
      this.$refs.form.reset();
      this.erroValidacao = false;
    },
    submit() {
      firebase
        .auth()
        .signInWithEmailAndPassword(this.form.email, this.form.password)
        .then(data => {
          this.$router.push({ path: "/Market" });
          this.popupLog = false;
        })
        .catch(err => {
          this.showLoginerror(err);
        });
    },
    showLoginerror(err) {
      this.erroValidacao = true;
      this.errorloginMsg = err.message;
    }
  },
  computed: {
    ...mapGetters({
      user: "user"
    })
  }
};
</script>

<style scoped >
.v-item-group.v-bottom-navigation {
  box-shadow: 0px 0px 0px 0px;
  background: #272929;
}

@media screen and (max-width: 600px) {
  .v-dialog {
    width: 85%;
  }
  .v-btn:not(.v-btn--round).v-size--default{
    height: 36px;
    min-width: 100%;
    margin-top: 8px;
  }
  .v-item-group.v-bottom-navigation{
    margin-top: 20px;
  }
}
</style>