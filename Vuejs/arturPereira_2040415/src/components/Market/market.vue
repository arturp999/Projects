<template>
  <div>
    <limao></limao>
  </div>
</template>



<script>
import limao from "@/components/ComponentesCustom/custom.vue"; //no import tenho de escrever o nome da componente
import axios from "axios";

export default {
  name: "Market",
  data() {
    return {};
  },
  components: {
    limao //importando o componente que vai ser usado
  }
};
</script>

<style scoped>

</style>