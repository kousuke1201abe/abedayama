<template>
  <v-content>
    <v-container fluid fill-height>
      <v-layout row justify-center>
        <v-flex xs12 text-center class="pa-10">
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-text-field
              v-model="quiz.name"
              :rules="nameRules"
              :counter="30"
              label="アーティスト名を入力"
              required
            ></v-text-field>
            <v-btn
              large
              @click.native="createQuiz"
              :disabled="!valid"
              depressed
              v-show="!loading"
              color="indigo"
              class="white--text"
            >クイズを作成</v-btn>
            <v-btn
              large
              @click.native="createQuiz"
              :disabled="!valid"
              depressed
              loading
              v-show="loading"
              color="indigo"
              class="white--text"
            >クイズを作成</v-btn>
          </v-form>
          <v-row dense class="mt-5">
            <v-col
              lg="4"
              md="4"
              sm="4"
              xs="3"
              v-for="quizu in quizzes"
              v-bind:key="quizu.urlCode"
              class="pa-2"
            >
              <router-link v-bind:to="{ name : 'quiz', params : { urlCode: quizu.urlCode }}">
                <v-card class="mx-auto pa-4" outlined>
                  <v-list-item-content>
                    <v-list-item-title>{{quizu.name}}クイズ</v-list-item-title>
                  </v-list-item-content>
                </v-card>
              </router-link>
            </v-col>
          </v-row>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
import gql from 'graphql-tag';
import createQuizGql from '../../common/api/graphql/createQuizGql';

const QUIZZES_QUERY = gql`
  query {
    quizzes {
      name
      urlCode
    }
  }
`;

export default {
  name: 'quiz',
  data: () => ({
    quizzes: QUIZZES_QUERY,
    quiz: {
      name: '',
      urlCode: ''
    },
    loading: false,
    valid: true,
    nameRules: [
      v => !!v || 'アーティスト名を入力してください',
      v =>
        (v && v.length <= 30) || 'アーティスト名は30文字以内で入力してください'
    ]
  }),
  methods: {
    createQuiz: function() {
      if (this.$refs.form.validate()) {
        this.loading = true;
        this.$apollo
          .mutate({
            mutation: createQuizGql,
            variables: {
              name: this.quiz.name
            }
          })
          .then(res => {
            this.loading = false;
            this.$router.push({
              name: 'quiz',
              params: { urlCode: res.data.createQuiz.quiz.urlCode }
            });
          })
          .catch(error => {
            console.error(error);
          });
      }
    }
  },
  apollo: {
    quizzes: {
      query: QUIZZES_QUERY
    }
  }
};
</script>
