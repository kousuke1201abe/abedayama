<template>
  <v-content>
    <v-container fluid fill-height>
      <v-layout row>
        <v-flex xs12 text-center class="pa-10">
          <div class="mb-5 display-1 font-weight-bold grey--text">
            イントロドンジェネレーター
            <v-icon size="45" color="teal lighten-2">headset</v-icon>
          </div>
          <div class="title font-weight-bold grey--text">アーティストの名前を入力するだけで、イントロドンを作成できます。</div>
          <div class="mb-10 title font-weight-bold grey--text">好きなアーティストの曲をどれだけ知っているか、試してみましょう。</div>
          <v-form ref="form" v-model="valid" lazy-validation class="mb-10">
            <v-flex>
              <v-text-field
                class="mb-5"
                v-model="quiz.name"
                :rules="nameRules"
                :counter="30"
                label="アーティスト名を入力してください"
                required
              ></v-text-field>
            </v-flex>
            <v-flex>
              <v-btn
                large
                @click.native="createQuiz"
                :disabled="!valid"
                rounded
                v-show="!loading"
                color="teal lighten-2"
                class="white--text font-weight-bold"
              >イントロドンを作成</v-btn>
              <v-btn
                large
                @click.native="createQuiz"
                :disabled="!valid"
                rounded
                loading
                v-show="loading"
                color="teal lighten-2"
                class="white--text font-weight-bold"
              >イントロドンを作成</v-btn>
            </v-flex>
          </v-form>
          <v-divider></v-divider>
          <div class="mt-10 title font-weight-bold grey--text">最新のイントロドン</div>
          <v-row dense class="mt-5 justify-start">
            <v-col
              lg="1"
              md="1"
              sm="1"
              xs="3"
              v-for="quiz in quizzes"
              v-bind:key="quiz.urlCode"
              class="ma-4"
            >
              <router-link v-bind:to="{ name: 'quiz', params: { urlCode: quiz.urlCode } }">
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-card class="mx-auto" max-width="100">
                      <v-img
                        class="white--text align-end"
                        height="100px"
                        v-bind:src="quiz.imageUrl"
                      ></v-img>
                      <v-card-subtitle class="pb-1 pt-1 text-truncate overline">
                        {{
                        quiz.name
                        }}
                      </v-card-subtitle>

                      <v-fade-transition>
                        <v-overlay v-if="hover" absolute color="#036358">
                          <v-btn class="overline">
                            {{
                            quiz.name
                            }}のイントロドンに挑戦
                          </v-btn>
                        </v-overlay>
                      </v-fade-transition>
                    </v-card>
                  </template>
                </v-hover>
              </router-link>
            </v-col>
          </v-row>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<style lang="scss">
a {
  text-decoration: none;
}
</style>

<script>
import getLatestQuizzesGql from '../../common/api/graphql/getLatestQuizzesGql';
import createQuizGql from '../../common/api/graphql/createQuizGql';

export default {
  name: 'quiz',
  data: () => ({
    quizzes: getLatestQuizzesGql,
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
      query: getLatestQuizzesGql
    }
  }
};
</script>
