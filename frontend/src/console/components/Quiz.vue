<template>
  <v-app>
    <v-content>
      <v-container fluid fill-height>
        <v-layout row justify-center>
          <v-flex md4 text-center>
            <v-form ref="form">
              <h3 class="ma-4">{{ quiz.name }}クイズ</h3>
              <v-icon @click="popUpTweetWindow" color="indigo">share</v-icon>
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
                          color="indigo"
                        ></v-radio>
                      </v-radio-group>
                    </v-card-actions>
                  </v-list-item-content>
                </v-card>
              </div>
              <v-btn class="white--text" depressed color="indigo" @click.native="answerQuiz">回答</v-btn>
            </v-form>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script lang="ts">
import gql from 'graphql-tag';
import { Component, Vue } from 'vue-property-decorator';
import { getApiUri } from '../../common/api/uri';

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

const ANSWERS_QUERY = gql`
  query($urlCode: String!, $answers: [String!]) {
    quiz(urlCode: $urlCode, answer: $answer) {
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
  data: () => ({
    quiz: POSTS_QUERY,
    replyAnswers: []
  }),
  apollo: {
    quiz: {
      query: POSTS_QUERY,
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
      }の曲当てクイズにチャレンジ&url=${getApiUri()}/${this.quiz.urlCode}`;
      const option = 'status=1,width=818,height=400,top=100,left=100';
      window.open(url, 'twitter', option);
    },
    reset: function() {
      this.$router.go({ path: this.$router.currentRoute.path, force: true });
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
