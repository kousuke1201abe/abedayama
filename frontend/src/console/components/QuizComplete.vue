<template>
  <v-app>
    <v-content>
      <v-container fluid fill-height>
        <v-layout row justify-center>
          <v-flex md4 text-center>
            <h3 class="ma-4">{{ quiz.name }}クイズ</h3>
            <h3 class="ma-4">5問中{{ quiz.correctNum }}問正解しました</h3>
            <v-btn to="/" depressed color="indigo" class="white--text">クイズを作成</v-btn>
            <v-icon @click="popUpTweetWindow" color="indigo">share</v-icon>
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
