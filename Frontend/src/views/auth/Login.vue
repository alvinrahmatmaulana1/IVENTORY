<template>
  <div class="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
    <div class="relative py-3 sm:max-w-xl sm:mx-auto">
      <div class="absolute inset-0 bg-gradient-to-r from-blue-300 to-blue-600 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl">
      </div>
      <div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
        <div class="max-w-md mx-auto">
          <div>
            <h1 class="text-2xl font-semibold">Login Form with Floating Labels</h1>
          </div>
          <div class="divide-y divide-gray-200">
            <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
              <div class="relative">
                <input v-model="formKey.email" autocomplete="off" id="email" name="email" type="text" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:border-rose-600" placeholder="Email" />
                <label for="email" class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm">Email</label>
              </div>
              <div class="relative">
                <input v-model="formKey.password" autocomplete="off" id="password" name="password" type="password" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:border-rose-600" placeholder="Password" />
                <label for="password" class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm">Password</label>
              </div>
              <div class="relative">
                <button @click="loginUsers()" class="bg-blue-500 text-white rounded-md px-2 py-1">Submit</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Swal from 'sweetalert2';
import { mapActions } from 'vuex';

export default {
  data() {
    return {
      formKey: {
        email: "",
        password: "",
      }
    };
  },
  methods: {
    ...mapActions('auth', ['login']),
    async loginUsers() {
      try {
        const response = await this.login(this.formKey);
        
        if (response && response.token && response.role) {
          const { token, role } = response;
          localStorage.setItem("token", token);
          localStorage.setItem("role", role);

          await Swal.fire({
            title: "Login Success",
            text: "Welcome!",
            icon: "success",
            confirmButtonText: "OK"
          });

          // Redirect user according to their role
          if (role === "pegawai") {
            this.$router.push("/");
          } else if (role === "admin") {
            this.$router.push("/admin");
          }
        } else {
          // Invalid response from server
          throw new Error("Invalid response from server");
        }
      } catch (error) {
        let errorMessage = "An error occurred during login";
        if (error.response && error.response.status === 401) {
          errorMessage = error.response.data.msg;
        }
        Swal.fire({
          title: "Error",
          text: errorMessage,
          icon: "error",
          confirmButtonText: "OK"
        });
      }
    }
  }
};
</script>
