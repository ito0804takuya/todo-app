<template>
  <v-app>
    <v-toolbar fixed>
      <v-toolbar-title v-text="title" />
    </v-toolbar>
    <v-content>
      <nuxt />
    </v-content>
    <v-footer center>
      <v-layout justify-center>
        <span>&copy; 2019 Yuhei Okazaki. All Rights Reserved.</span>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      title: 'Tasks'
    }
  }
}
</script>