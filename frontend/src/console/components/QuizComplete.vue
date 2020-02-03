<template>
  <v-app>
    <v-content>
      <v-container fluid fill-height>
        <v-layout row justify-center>
          <v-flex md4 text-center>
            <v-card class="mx-auto mt-5" max-width="450">
              <v-img class="white--text align-end" height="450px" v-bind:src="quiz.imageUrl"></v-img>
              <v-card-subtitle class="text-truncate overline">
                {{
                quiz.name
                }}
                <v-icon @click="popUpTweetWindow" color="teal lighten-1">share</v-icon>
                <h1 class="ma-4">5問中{{ quiz.correctNum }}問正解しました</h1>
              </v-card-subtitle>
            </v-card>
            <div v-for="(question, idx) in quiz.questions" v-bind:key="question.id" class="ma-4">
              <v-card class="mx-auto pa-4" outlined>
                <v-list-item-content>
                  <v-list-item-title class="overline mb-4">question No.{{ idx+1 }} Answer</v-list-item-title>
                  <v-list-item-title class="headline mb-4">{{question.correctAnswer.content}}</v-list-item-title>
                  <v-list-item-title class="headline">
                    <audio controls>
                      <source :src="question.content" />
                    </audio>
                  </v-list-item-title>
                </v-list-item-content>
              </v-card>
            </div>
            <v-btn
              to="/"
              large
              rounded
              color="teal lighten-1"
              class="white--text m-10"
            >新しいイントロドンを作成する</v-btn>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import { getApiUri } from '../../common/api/uri';
import clacCorrectAnswersGql from '../../common/api/graphql/calcCorrectAnswersGql';

export default {
  name: 'helloworld',
  data: () => ({
    quiz: clacCorrectAnswersGql,
    message: ''
  }),
  methods: {
    popUpTweetWindow() {
      const url = `https://twitter.com/intent/tweet?text=${
        this.quiz.name
      }の曲当てクイズに${
        this.quiz.correctNum
      }問正解しました。チャレンジはこちらから&url=${getApiUri()}/quiz/${
        this.quiz.urlCode
      }`;
      const option = 'status=1,width=818,height=400,top=100,left=100';
      window.open(url, 'twitter', option);
    }
  },
  apollo: {
    quiz: {
      query: clacCorrectAnswersGql,
      prefetch: ({ route }) => ({ urlCode: route.params.urlCode }),
      variables() {
        return {
          urlCode: this.$route.params.urlCode,
          answers: this.$route.params.replyAnswers
        };
      }
    }
  }
};
</script>
