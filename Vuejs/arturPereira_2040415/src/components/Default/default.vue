<template>
  <v-content align="center" justify="center">
    <main>
      <h1 class="mt-10">Oops! That page doesn't exists!</h1>
      <h2 class="mb-10">Try one of the pages bellow!</h2>
      <v-container class="pa-12">
        <v-btn to="/contact" class="butt" fab dark large color="orange">Contact</v-btn>
        <v-btn to="/market" class="butt ml-5 mr-5" fab dark large color="blue">Market</v-btn>
        <v-btn to="/search" class="butt" fab dark large color="green">Search</v-btn>
      </v-container>
    </main>
  </v-content>
</template>

<style  scoped>
.butt {
  height: 80px;
  width: 80px;
}
</style>