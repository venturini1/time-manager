<template>  
  <Dashboard />
</template>

<script>
import "@/assets/main.css";
import Chart from 'primevue/chart';
import Dashboard from './components/Dashboard.vue'
export default {
  name: 'App',
  components: {
    Dashboard,
    Chart
  }
}
</script>


<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
<!-- 
<template>
  <EditableDashboard />
</template>

<script setup>
import "@/assets/main.css";
import EditableDashboard from "./components/EditableDashboard.vue";
</script> -->
