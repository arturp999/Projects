<template>
  <div class="mt-10">
    <header>
      <h1
        id="mobile"
        class="d-flex justify-center font-weight-medium"
      >Pesquise qualquer raça que pretenda!</h1>
    </header>
    <v-container fluid class="d-flex justify-center mt-5">
      <transition  name="fade">
        <v-alert
          v-if="popError"
          type="error"
          height="55px"
          width="30%"
          class="mb-0 pb-0"
        >Essa raça nao existe!</v-alert>
      </transition>
    </v-container>

    <div class="d-flex justify-center">
      <v-card width="800px" class="searching mt-8 text-md-center">
        <v-text-field
          class="pa-0 mr-2 ml-2"
          v-model="pesquisa"
          label="Insira a raça que quer procurar"
          single-line
        ></v-text-field>
        <v-btn class="green" width="100%" @click="carregaCaes(pesquisa)">Procurar</v-btn>
        <div v-for="(item , index) in resultados" :key="index">
          <h3>{{item}}</h3>
          <img :src="item" alt />
        </div>
      </v-card>
    </div>

    <div>
      <v-card class="d-flex flex-wrap justify-center mt-5" flat tile>
        <v-card
          id="mobileIMG"
          max-width="400"
          v-on:click="nextDog()"
          v-for="(item,i) in items"
          :key="i"
          class="pa-0 ma-4 flex"
          outlined
          tile
        >
          <v-img min-height="100%" max-height="270" :src="item">
            <template v-slot:placeholder>
              <v-row class="fill-height ma-0" align="center" justify="center">
                <v-progress-circular indeterminate color="grey lighten-5"></v-progress-circular>
              </v-row>
            </template>
          </v-img>
        </v-card>
      </v-card>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  components: {},
  name: "Search",
  props: {
    breed: String
  },
  data() {
    return {
      resultados: "",
      pesquisa: "",
      items: [],
      popError: false,
      items_bread: [
        {
          text: "Home",
          disabled: false,
          href: "/"
        },
        {
          text: "Search",
          disabled: true,
          href: "breadcrumbs_link_1"
        }
      ]
    };
  },
  created() {
    // axios.get(URL).then(res => this.carregaCaes(res));
  },
  methods: {
    carregaCaes(breed) {
      axios
        .get("http://localhost:8080/api/breed/" + breed + "/images")
        .then(res => {
          this.items = res.data.message;
        })
        .catch(error => {
          this.popError = true;
          setTimeout(() => (this.popError = false), 5000);
        });
    },
    nextDog() {
      //console.log(this.pesquisa)
      this.$router.push({ path: `/breed/${this.pesquisa}` }); // -> /user/123
    }
  }
};
</script>

<style scoped>
a {
  text-decoration: none;
}
.searching {
  background: #272929;
}

@media screen and (max-width: 600px) {
  #MOBILE {
    display: none;
  }
  #mobile {
    font-size: 20px;
    text-align: center;
  }

  #mobileIMG {
    width: 330px;
  }
}
</style>