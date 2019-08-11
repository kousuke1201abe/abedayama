<template>
  <v-app>
    <div class="helloworld">
      <p>{{ quizzes }}</p>
    </div>
    <v-alert :value="true" type="success">This is a success alert.</v-alert>
  </v-app>
</template>

<script lang="ts">
import gql from 'graphql-tag';
import { Component, Vue } from 'vue-property-decorator';

const POSTS_QUERY = gql`
  {
    quizzes {
      name
    }
  }
`;

export default {
  name: 'helloworld',
  data() {
    return {
      quizzes: POSTS_QUERY
    };
  },
  apollo: {
    quizzes: {
      query: POSTS_QUERY
    }
  }
};
</script>

<style lang="scss">
.helloworld {
  font-size: 50px;
  p {
    color: red;
  }
}
</style>
