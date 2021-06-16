<template>
  <div>
    <v-bottom-navigation grow>
      <v-btn icon x-large v-on:click="showCart = true">
        <span v-if="count == 0">Cart</span>
        <v-icon v-if="count == 0">mdi-cart-outline</v-icon>
        <span id="desp" v-if="count > 0">Cart</span>
        <v-badge
          id="mobileBadge"
          class="cart"
          color="green"
          v-if="count > 0"
          v-bind:content="count"
        >
          <v-icon>mdi-cart-outline</v-icon>
        </v-badge>
      </v-btn>
    </v-bottom-navigation>

    <v-dialog
      v-if="count > 0"
      v-model="showCart"
      hide-overlay
      transition="dialog-bottom-transition"
      scrollable
      width="600px"
    >
      <v-simple-table class="dialogBox">
        <template class="bg" v-slot:default max>
          <thead>
            <tr>
              <th class="text-center">Imagem</th>
              <th class="text-center">Name</th>
              <th class="text-center">Quantidade</th>
              <th class="text-center">Valor</th>
              <th class="text-center">Operações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="shopArticle in shopItems" :key="shopArticle.Id">
              <td class="imgContainer bg-dialogo">
                <img class="imgCart bg-dialogo" :src="shopArticle.Image" />
              </td>
              <td class="bg-dialogo text-center">{{shopArticle.Nome}}</td>
              <td class="bg-dialogo text-center">x{{shopArticle.Quantity}}</td>
              <td class="bg-dialogo text-center">{{shopArticle.Preco}}€</td>
              <td align="center" justify="center" class="bg-dialogo">
                <v-btn class="butao" v-on:click="rmCart(shopArticle)" small color="red">-</v-btn>
              </td>
            </tr>
            <tr>
              <td class="bg-dialogo"></td>
              <td class="bg-dialogo"></td>
              <td class="bg-dialogo"></td>
              <td class="bg-dialogo">Valor total:</td>
              <td class="bg-dialogo">
                <v-bottom-sheet v-model="popup" persistent>
                  <template v-slot:activator="{ on }">
                    <v-btn color="green f_button" dark v-on="on">{{ finalValue }}€</v-btn>
                  </template>
                  <v-sheet class="text-center checkoutHomie">
                    <div class="py-3">
                      <h1 class="display-1 font-weight-bold mb-3">Checkout</h1>
                      <h3 class="font-italic font-weight-light">Total of Dogs: {{count}}</h3>
                      <h3 class="font-italic font-weight-light">Total: {{ finalValue }}€</h3>
                    </div>
                    <v-btn class="mt-6" color="success" v-on:click="checkOut()">Buy :)</v-btn>
                  </v-sheet>
                </v-bottom-sheet>
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-dialog>
  </div>
</template>


 <script>
export default {
  name: "Cart",
  data() {
    return {
      showCart: false,
      popup: false
    };
  },
  methods: {
    checkOut: function() {
      this.$store.dispatch("emptyCart");
      this.popup = !this.popup;
      this.$router.push({ path: "/" });
    },
    rmCart: function(dog) {
      this.$store.dispatch("removeShopitems", dog);
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
    },
    finalValue: function() {
      var total = 0;
      this.$store.state.shopItems.forEach(element => {
        total += element.Preco * element.Quantity;
      });
      return total;
    }
  }
};
</script>
<style scoped>
.imgContainer {
  width: 80px;
  height: 80px;
  padding: 1px;
}
.imgCart {
  width: 100%;
  height: 100%;
  border-radius: 50px;
}
.dialogBox {
  width: 100%;
  max-height: 500px;
}
.bg-dialogo {
  background-color: #1e1e1e;
}
.f_button {
  width: 100%;
  height: 100%;
}

.checkoutHomie {
  height: 200px;
  width: 300px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -50px;
  margin-left: -50px;
  border: 1px solid white !important;
}

.v-item-group.v-bottom-navigation {
  box-shadow: 0px 0px 0px 0px;
  background: #272929;
}

@media screen and (max-width: 600px) {
  .imgCart {
    width: 55px;
    height: 55px;
    border-radius: 50px;
  }
  .v-data-table td,
  .v-data-table th {
    padding: 4px;
  }
  .f_button {
    width: 50px;
  }
  .checkoutHomie {
    height: 200px;
    width: 200px;
    position: absolute;
    top: 25%;
    left: 25%;
    margin-top: 0px;
    margin-left: 0px;

    border: 1px solid white !important;
  }
  span,.green {
    margin-bottom: -8px !important;
    margin-left: -8px !important;
  }
  #desp{
    display: none;
  }
}
</style>