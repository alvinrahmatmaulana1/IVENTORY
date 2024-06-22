<template>
    <div>
      <SidebarMain/>
      <router-view/>
    </div>
  </template>
  <script>
  import SidebarMain from '../components/main/SidebarMain.vue';
  export default {
    components: {
      SidebarMain,
    },
  };
  </script>