<template>
  <div>
    <h1
      id="mobileOnly"
      class="font-weight-light font-italic d-flex justify-center"
    >We have the best dogs for sale!</h1>
    <div class="linha"></div>
    <v-row justify="center" id="MOBILE">
      <v-container fluid class="d-flex justify-center">
        <transition name="fade">
          <v-alert
            v-if="popSucess"
            type="success"
            height="55px"
            width="300px"
            class="mb-0 pb-0"
          >Successfully added to the cart</v-alert>
        </transition>
      </v-container>

      <v-col
        v-on:click="addCart(dog)"
        fill-height
        cols="2"
        v-for="dog in dogs"
        :key="dog.Id"
        class="limao"
      >
        <h1 class="titulo-raca">{{dog.Nome}}</h1>
        <div class="square">
          <img class="imagens" :src="dog.Image" />
          <div class="containerButao">
            <!-- <v-btn class="butao" v-on:click="addCart(dog)" small color="green">+</v-btn> -->
            <h3>{{dog.Preco}}€</h3>
            <!-- <v-btn class="butao" v-on:click="rmCart(dog)" small color="red">-</v-btn> -->
          </div>
        </div>
      </v-col>
    </v-row>
  </div>
</template>
  
<script>
import axios from "axios";

export default {
  name: "Custom",
  data() {
    return {
      dogs: [],
      shopArticles: [], //push o artigo para o carrinho
      popSucess: false
    };
  },
  components: {},
  created() {
    axios
      .get("https://frontend-uma.firebaseio.com/.json")
      .then(res => {
        this.dogs = res.data;
      })
      .catch(error => {
        console.log(error);
      });
  },
  methods: {
    addCart: function(dog) {
      this.$store
        .dispatch("addtoShopitems", dog)
        .then((this.shopArticles = this.$store.state.shopItems));
      this.popSucess = true;
      setTimeout(() => (this.popSucess = false), 1000);
    }
  },
  computed: {
    shopItems: function() {
      return this.$store.getters.getshopItems;
    },
    count: function() {
      var total = 0;
      this.$store.state.shopItems.forEach(element => {
        total += element.Quantity;
      });
      return total;
    }
  },
  mounted() {}
};
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

.linha {
  background: grey;
  height: 1px;
}
.containerButao {
  display: flex;
  text-align: center;
  align-self: center;
  justify-content: center;
}
.butao {
  margin: 1px;
}

.limao {
  margin: 20px;
  margin-bottom: 50px;
  text-align: center;
}
.limao:hover {
  cursor: pointer;
}

.titulo-raca {
  background: black;
  width: 150px;
  margin-left: auto;
  margin-right: auto;
  font-size: 20px;
}

.square {
  height: 100px;
  width: 150px;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 30px;
}

.imagens {
  width: 150px;
  height: 150px;
  object-fit: cover;
  overflow: hidden;
  border-radius: 0px 0px 200px 200px;
}

@media screen and (max-width: 600px) {
  #mobileOnly {
    font-size: 23px;
    margin-top: 30px;
  }

  .imagens {
    width: 100px;
    height: 100px;
  }
  .titulo-raca {
    font-size: 15px;
    width: 100px;
  }
  .containerButao {
    font-size: 15px;
  }
  .limao {
    margin: 0px;
  }
  .col-2 {
    max-width: none;
  }
}
</style>