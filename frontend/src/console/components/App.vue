<template>
  <v-app>
    <router-link :to="{ name: 'test', params: { id: 7 }}">LINK tester</router-link>
    <router-view></router-view>
  </v-app>
</template>
