<template>
  <v-content align="center" justify="center">
    <header>
      <h1 class="mt-5">Welcome we have the best dogs in the World!</h1>
      <h5 class="text-align mt-3">Select a button bellow to be directed to another page</h5>
    </header>
    <br />
    <v-container class="pa-0">
      <v-btn to="/contact" class="butt" fab dark large color="orange">Contact</v-btn>
      <v-btn to="/market" class="butt ml-5 mr-5" fab dark large color="blue">Market</v-btn>
      <v-btn to="/search" class="butt" fab dark large color="green">Search</v-btn>
    </v-container>
    <main>
      <v-container class="mt-5">
        <h2 class="mb-2 font-weight-light font-weight-thin">Most recent dogs</h2>
        <v-container class="d-flex">
          <v-carousel class="containerIMG" hide-delimiters>
            <router-link to="/market">
              <v-carousel-item
                v-for="(dogsCarrosel,Id) in dogsCarrosels"
                :key="Id"
                :src="dogsCarrosel.Image4k"
                class="carroselIMG"
              ></v-carousel-item>
            </router-link>
          </v-carousel>

          <v-form class="ml-4 pa-0 dogInfos">
            <!-- Informação no lado direito dos cares -->
            <h3 class="mb-3">Information about dogs</h3>
            <div class="texto font-italic font-weight-medium">
              <p>
                Dogs were domesticated from wolves as recently as 15,000 years ago. New evidence suggests that dogs were first domesticated in East Asia, possibly China. Over time, the dog has developed into hundreds of breeds with a great degree of variation.
                <br />
                <br />
                <br />
                <br />The common name for the domestic dog is ‘Canis familiaris‘, a species of the dog family ‘Canidae’. The dog is generally considered the ‘first’ domesticated animal.
              </p>
            </div>
          </v-form>
        </v-container>
      </v-container>

      <v-container>
        <v-row id="MOBILE">
          <v-col fill-height cols="12" md="12">
            <v-card class="pa-3 font-weight-medium display-1">Dog Facts!</v-card>
          </v-col>
          <v-col cols="3">
            <v-card
              class="orange textoFacts caixasFacts"
            >Dogs have a sense of time. It's been proven that they know the difference between a hour and five. If conditioned to, they can predict future events, such as regular walk times.</v-card>
          </v-col>

          <v-col cols="3">
            <v-card
              class="red textoFacts caixasFacts"
            >A study at UCSD claims that your dog can genuinely get jealous when they see you display affection for another creature.</v-card>
          </v-col>
          <v-col cols="3">
            <v-card
              class="blue textoFacts caixasFacts"
            >The United States has the highest pet dog population in the world. Approximately 75.8 million in fact.</v-card>
          </v-col>

          <v-col cols="3">
            <v-card
              class="green textoFacts caixasFacts"
            >Dogs can be trained to to detect cancer and other diseases in humans. Cancerous cells release different metabolic waste products than healthy cells in the human body. Dogs may even be able to sniff out cancer cells simply through smelling someone’s breath.</v-card>
          </v-col>
        </v-row>

        <v-row id="MOBILE">
          <v-col fill-height cols="12" md="12"></v-col>
          <v-col cols="3">
            <v-card
              class="green textoFacts caixasFacts"
            >Your dog can help get you a date! One study showed that a man’s chances of getting a girl’s phone number went from 10% to 33%, just by having a dog with them. In the study, a staggering 66% of men and women would not date someone who didn’t like pets.</v-card>
          </v-col>

          <v-col cols="3">
            <v-card
              class="blue textoFacts caixasFacts"
            >Your dog can smell your feelings. In fact, your dog’s sense of smell is approximately 100,000 times better than yours. So it shouldn’t be shocking that they can in fact, smell things such as fear. When a human is fearful, they perspire, and a dog is easily able to pick up on this change.</v-card>
          </v-col>
          <v-col cols="3">
            <v-card
              class="red textoFacts caixasFacts"
            >Dogs can be trained to to detect cancer and other diseases in humans. Cancerous cells release different metabolic waste products than healthy cells in the human body. Dogs may even be able to sniff out cancer cells simply through smelling someone’s breath.</v-card>
          </v-col>

          <v-col cols="3">
            <v-card
              class="orange textoFacts caixasFacts"
            >Do you have a dog that experiences separation anxiety? Try leaving some clothing with him that you’ve worn. It’s been proven that the scent you leave behind on your clothes can help ease your dog’s separation anxiety.</v-card>
          </v-col>
        </v-row>
      </v-container>
    </main>
  </v-content>
</template>

<script scoped>
import axios from "axios";

export default {
  name: "Home",
  data() {
    return {
      dogsCarrosels: []
    };
  },
  created() {
    this.dogCar();
  },
  methods: {
    dogCar() {
      axios
        .get("https://frontend-uma.firebaseio.com/.json")
        .then(res => {
          this.dogsCarrosels = res.data;
        })
        .catch(error => console.error(error));
    }
  }
};
</script>

<style scoped>
.butt {
  height: 80px;
  width: 80px;
}
.carroselIMG {
  width: 100%;
  object-fit: cover;
}
.containerIMG {
  max-width: 1200px;
  min-width: 250px;
}
.texto {
  width: 185px;
  display: inline-flex;
  font-size: 15px;
}
.textoFacts {
  font-size: 15px;
  white-space: normal;
  padding: 20px;
}
.caixasFacts {
  height: 250px;
  padding: 5px;
  line-height: 1.6;
  display: flex;
  justify-content: center;
  align-items: center;
}

@media screen and (max-width: 600px) {
  .dogInfos {
    display: none;
  }
  .caixasFacts {
    min-width: 250px;
    height: 230px;
    padding: 5px;
    margin-left: 60px;
  }
  #MOBILE {
    display: inline;
    padding: 0px;
  }
}

@media (min-width: 1904px) {
  .container {
    max-width: 90%;
  }
}
</style>


