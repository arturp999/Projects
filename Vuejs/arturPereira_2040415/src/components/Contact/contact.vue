<template>
  <v-content class="mt-5">
    <h1 class="text-center">CONTACT US</h1>
    <v-toolbar-title class="pt-2" align="center">Having any issues ? Please register</v-toolbar-title>
    <v-system-bar class="grey mt-1 mb-7" height="1px"></v-system-bar>

    <v-container>
      <v-layout align-center justify-center>
        <v-card class="elevation-12 pa-3" width="600px" height="512px">
          <v-form action="#" @submit.prevent="submit" ref="form" v-model="valid" lazy-validation>
            <v-input>
              <v-text-field
                id="name"
                type="name"
                name="name"
                label="Name"
                class="pl-2 pr-2 form-control"
                prepend-icon="mdi-account"
                v-model="form.name"
                :counter="50"
                :rules="nameRules"
                required
              ></v-text-field>
            </v-input>

            <v-input>
              <v-text-field
                id="email"
                type="email"
                name="email"
                class="pl-2 pr-2 mb-2 form-control"
                prepend-icon="mdi-email"
                v-model="form.email"
                :rules="emailRules"
                label="E-mail"
                required
              ></v-text-field>
            </v-input>

            <v-input>
              <v-text-field
                id="password"
                type="password"
                class="form-control"
                name="password"
                label="Password"
                prepend-icon="mdi-lock"
                required
                :rules="passwordRules"
                v-model="form.password"
              ></v-text-field>
            </v-input>
            <v-alert v-if="erroValidacao" type="error">{{errorMsg}}</v-alert>
            <v-checkbox
              class="mt-n1 pl-2 pb-3"
              v-model="checkbox"
              :rules="[v => !!v || 'You must agree to continue!']"
              label="Do you wish to submit?"
              required
            ></v-checkbox>
            <section align="center" class="pb-5">
              <v-btn
                type="submit"
                :disabled="!valid"
                color="success"
                class="mr-7 mb-2"
                @click="validate"
              >Submit</v-btn>

              <v-btn color="error" class="mr-7 mb-2" @click="reset">Reset Information</v-btn>
            </section>
          </v-form>
        </v-card>

        <v-card
          id="MOBILE"
          class="elevation-12 pa-1 ml-2"
          min-width="250px"
          width="300px"
          height="512px"
        >
          <h3 class="text-center mt-2">CONTACT DETAILS</h3>
          <v-system-bar class="grey mt-1" height="1px"></v-system-bar>
          <v-card-text class="subtitle-2 text-center mt-3">
            <v-icon class="ml-n10 mr-5">mdi-cellphone-android</v-icon>+351 965 400 55
          </v-card-text>

          <v-card-text class="subtitle-2 text-center">
            <v-icon class="ml-n10 mr-5">mdi-web</v-icon>siterandom.com
          </v-card-text>

          <v-card-text class="subtitle-2 text-center">
            <v-icon class="ml-n12 mr-5">mdi-skype</v-icon>Artur__pereira
          </v-card-text>

          <h3 class="text-center">SOCIAL</h3>
          <v-system-bar class="grey mt-1" height="1px"></v-system-bar>
          <div class="text-center mt-3">
            <v-btn class="mx-2" fab dark small color="#405DE6">
              <v-icon dark>mdi-facebook</v-icon>
            </v-btn>

            <v-btn class="mx-2" fab dark small color="#1DA1F2">
              <v-icon dark>mdi-twitter</v-icon>
            </v-btn>

            <v-btn class="mx-2" fab dark small color="red">
              <v-icon dark>mdi-linkedin</v-icon>
            </v-btn>

            <v-btn class="mx-2" fab dark small color="#F56040">
              <v-icon dark>mdi-instagram</v-icon>
            </v-btn>

            <br />
            <v-card-text class="subtitle-1">Our CEO</v-card-text>
            <v-avatar class="mt-0" size="100px">
              <img
                class="img-circle elevation-7 mb-1"
                src="https://blog.yellowoctopus.com.au/wp-content/uploads/2018/03/yellow-octopus-funny-memes-72.jpg"
              />
            </v-avatar>
            <v-card-text class="subtitle-1 mb-0">Alfredo Esdrubal</v-card-text>
          </div>
        </v-card>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
import firebase from "firebase";

export default {
  name: "Contact",
  data() {
    return {
      form: {
        name: "",
        email: "",
        password: ""
      },
      valid: true,
      erroValidacao: false,
      errorMsg: "",
      nameRules: [
        v => !!v || "Name is required",
        v => (v && v.length <= 50) || "Name must be less than 50 characters"
      ],
      email: "",
      emailRules: [
        v => !!v || "E-mail is required",
        v => /.+@.+\..+/.test(v) || "E-mail must be valid"
      ],
      password: "",
      passwordRules: [
        v => !!v || "Password is required",
        v => (v && v.length > 5) || "Pass must be more than 5 characters"
      ],
      checkbox: "",
      error: null
    };
  },
  props: {
    source: String
  },
  methods: {
    submit() {
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.form.email, this.form.password)
        .then(data => {
          data.user
            .updateProfile({
              displayName: this.form.name
            })
            .then(data => {
              this.$router.push({ path: "/" });
            });
        })
        .catch(err => {
          this.showError(err);
          //123456@gmail.com 123456
        });
    },
    showError(err) {
      this.erroValidacao = true;
      this.errorMsg = err.message;
    },
    validate() {
      this.$refs.form.validate();
    },
    reset() {
      this.$refs.form.reset();
    },
    resetValidation() {
      this.$refs.form.resetValidation();
    }
  }
};
</script>

<style scoped>
@media screen and (max-width: 600px) {
  #MOBILE {
    display: none;

  }
}
</style>