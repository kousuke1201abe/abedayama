<template>
  <v-app>
    <v-content>
      <v-container fluid fill-height>
        <v-layout row justify-center>
          <v-flex md4 text-center>
            <v-form ref="form">
              <v-card class="mx-auto mt-5" max-width="450">
                <v-img class="white--text align-end" height="450px" v-bind:src="quiz.imageUrl"></v-img>
                <v-card-subtitle class="text-truncate overline">
                  {{
                  quiz.name
                  }}
                  <v-icon @click="popUpTweetWindow" color="teal lighten-1">share</v-icon>
                </v-card-subtitle>
              </v-card>
              <div v-for="(question, idx) in quiz.questions" v-bind:key="question.id" class="ma-4">
                <v-card class="mx-auto pa-4" outlined>
                  <v-list-item-content>
                    <v-list-item-title class="overline mb-4 ml-4">question No.{{ idx+1 }}</v-list-item-title>
                    <v-list-item-title class="headline">
                      <audio controls>
                        <source :src="question.content" />
                      </audio>
                    </v-list-item-title>
                    <v-card-actions>
                      <v-radio-group required>
                        <v-radio
                          v-for="answer in question.answers"
                          :key="answer.id"
                          :label="answer.content"
                          :value="answer.content"
                          @change="onchange(answer.content, idx)"
                          color="teal lighten-1"
                        ></v-radio>
                      </v-radio-group>
                    </v-card-actions>
                  </v-list-item-content>
                </v-card>
              </div>
              <v-btn
                large
                class="white--text m-5"
                rounded
                color="teal lighten-1"
                @click.native="answerQuiz"
              >回答する</v-btn>
            </v-form>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import { getApiUri } from '../../common/api/uri';
import getQuizGql from '../../common/api/graphql/getQuizGql';

export default {
  name: 'helloworld',
  data: () => ({
    quiz: getQuizGql,
    replyAnswers: []
  }),
  apollo: {
    quiz: {
      query: getQuizGql,
      prefetch: ({ route }) => ({ urlCode: route.params.urlCode }),
      variables() {
        return { urlCode: this.$route.params.urlCode };
      }
    }
  },
  methods: {
    onchange: function(content, idx) {
      if (this.replyAnswers[idx] !== undefined) {
        this.replyAnswers.splice(idx, 1, content);
      } else {
        this.replyAnswers.splice(idx, 0, content);
      }
    },
    answerQuiz: function() {
      this.$router.push({
        name: 'quizComplete',
        params: {
          urlCode: this.quiz.urlCode,
          replyAnswers: this.replyAnswers
        },
        query: {
          replyAnswers: this.replyAnswers
        }
      });
    },
    popUpTweetWindow() {
      const url = `https://twitter.com/intent/tweet?text=${
        this.quiz.name
      }の曲当てクイズにチャレンジ&url=${getApiUri()}/quiz/${this.quiz.urlCode}`;
      const option = 'status=1,width=818,height=400,top=100,left=100';
      window.open(url, 'twitter', option);
    },
    reset: function() {
      this.$router.go({ path: this.$router.currentRoute.path, force: true });
    }
  }
};
</script>
