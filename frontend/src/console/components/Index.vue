<template>
  <v-container>
    <v-form ref="form" v-model="valid" lazy-validation>
      <v-text-field v-model="quiz.name" :rules="nameRules" :counter="20" label="名前" required></v-text-field>
      <v-btn @click.native="createQuiz" :disabled="!valid">追加</v-btn>
      <v-btn @click="clear">クリア</v-btn>
    </v-form>
  </v-container>
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
    valid: true,
    nameRules: [
      v => !!v || '名前は必須項目です',
      v => (v && v.length <= 20) || '名前は20文字以内で入力してください'
    ]
  }),
  methods: {
    createQuiz: function() {
      if (this.$refs.form.validate()) {
        this.$apollo
          .mutate({
            mutation: createQuizGql,
            variables: {
              name: this.quiz.name
            }
          })
          .then(res => {
            this.$router.push({
              name: 'quiz',
              params: { urlCode: res.data.createQuiz.quiz.urlCode }
            });
          })
          .catch(error => {
            console.error(error);
          });
      }
    },
    clear: function() {
      this.$refs.form.reset();
    }
  }
};
</script>
