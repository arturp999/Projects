<template>
  <v-content align="center" justify="center">
    <v-container class="mt-5 containerIMG">
      <h2 class="mb-2 font-weight-light font-weight-thin">The {{name}} breed</h2>
      <v-container>
        <v-img class="containerIMG" hide-delimiters :src="imgUrl"></v-img>
      </v-container>
      <!-- <v-btn v-on:click="created()" color="blue">Another sub-breed ?</v-btn> -->
    </v-container>
  </v-content>
</template>

<script>
const apiUrl = "https://dog.ceo/api/breed/";
const endapiUrl = "/images/random";

import axios from "axios";

export default {
  name: "Breed",
  data() {
    return {
      imgUrl: "",
      name: ""
    };
  },
  created() {
    this.name = this.$route.params.name;
    axios
      .get(apiUrl + this.name + endapiUrl)
      .then(res => {
        this.imgUrl = res.data.message;
        console.log(res);
      })
      .catch(err => {
        alert("No sub-breeds found");
      });
  }
};
</script>

<style scoped>
.IMG {
  width: 100%;
  object-fit: cover;
}
.containerIMG {
  max-width: 500px;
  min-width: 250px;
  max-height: 500px;
}
</style>