<template>
  <v-content>
    <v-container fluid fill-height>
      <v-layout row justify-center>
        <v-flex xs12 text-center class="ma-10">
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
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
import createQuizGql from '../../common/api/graphql/createQuizGql';

export default {
  name: 'quiz',
  data: () => ({
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
  }
};
</script>
