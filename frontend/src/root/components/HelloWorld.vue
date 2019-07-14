<template>
  <v-app>
    <div class="helloworld">
      <p>{{ name }}</p>
    </div>
    <p>{{ message }}</p>
    <v-alert :value="true" type="success">This is a success alert.</v-alert>
  </v-app>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component
export default class HelloWorld extends Vue {
  name: string = 'Hello World';
}
</script>

<style lang="scss">
.helloworld {
  font-size: 50px;
  p {
    color: red;
  }
}
</style>
