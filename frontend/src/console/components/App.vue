<template>
  <v-app>
    <v-app-bar app hide-on-scroll dense color="white" dark>
      <router-link to="/">
        <v-toolbar-title class="subtitle-1 font-weight-bold ml-3 grey--text">
          ぼっちイントロドンジェネレーター
          <v-icon color="teal lighten-1">headset</v-icon>
        </v-toolbar-title>
      </router-link>
    </v-app-bar>
    <router-view></router-view>
  </v-app>
</template>
