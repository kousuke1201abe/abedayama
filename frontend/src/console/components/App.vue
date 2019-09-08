<template>
  <v-app>
    <router-link :to="{ name: 'test', params: { url_code: 'aaaa' }}">LINK tester</router-link>
    <router-view></router-view>
  </v-app>
</template>
