<template>
    <div class="min-h-screen flex">
      <Sidebar />
      <div class="flex-grow p-4 sticky top-0 z-10">
        <!-- <navbar /> -->
        <router-view />
     
      </div>
    </div>
    <!-- <Footer/> -->
  </template>
  <script>
  import Sidebar from "../components/admin/Sidebar.vue";
  // import navbar from "../components/admin/Navbar.vue";
  // import Footer from "../components/admin/Footer.vue";
  
  export default {
    components: {
      Sidebar,
      // navbar,
      // Footer
    },
  };
  </script>
  <!-- <style>
  /* Add this style block to your component's style block */
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s ease-out; /* Adjust the transition duration and easing function as needed */
  }
  .fade-enter, .fade-leave-to {
    opacity: 0;
    transition-delay: 0.3s; /* Adjust the delay duration as needed */
  }
  
  /* Additional styling for smoother transition */
  .router-view-container {
    position: relative;
    overflow: hidden;
  }
  </style> -->
  
  
  