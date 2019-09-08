<template>
  <v-app>
    <div class="helloworld">
      <p>{{ quiz }}</p>
      <p>{{this.$route.params['id']}}</p>
      <p>{{this.quizId}}</p>
    </div>
    <v-alert :value="true" type="success">This is a success alert.</v-alert>
  </v-app>
</template>

<script lang="ts">
import gql from 'graphql-tag';
import { Component, Vue } from 'vue-property-decorator';

const POSTS_QUERY = gql`
  query($urlCode: String!) {
    quiz(urlCode: $urlCode) {
      urlCode
      name
      questions {
        content
        answers {
          content
        }
      }
    }
  }
`;

export default {
  name: 'helloworld',
  created() {
    this.quizId = this.$route.params['id'];
  },
  data() {
    return {
      quiz: POSTS_QUERY
    };
  },
  apollo: {
    quiz: {
      query: POSTS_QUERY,
      variables: {
        id: 2
      }
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
