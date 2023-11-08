
<script setup>
import axios from 'axios';
import ModalUser from './ModalUser.vue'
import ModalConnection from './ModalConnection.vue';
// import ScriptSetupe from './ScriptSetupe.vue';
import { ref, computed, onMounted, onBeforeUnmount } from 'vue';
import {useStore }from '@/components/Store.js'

const Store =  useStore();


// export default {
//   name: 'UserProfile',
//   components: { ModalUser, ModalConnection, 
//     // ScriptSetupe 
//    },
//   data() {
//     return {
//       ModalUser: true,
//     }
//   },

// }




var datar = []
var datarr = ref(datar);

const setChart = async () => {
    try {
        const response = await axios.get('http://localhost:4000/api/users/2'); 
        const chartData = response.data;


        console.log(chartData.data.id);
        Store.name = chartData.data.username;
        datar[1] = chartData.data.email;
        datarr.value = datar[0];
        console.log(datar);
        console.log('bonjour');
        console.log(datarr.value);
    } catch (error) {
        console.error('Error fetching chart data:', error);
    }
};


setChart();
console.log(datarr.value);

console.log()




</script>


<template>
  <div class="Profil">
    <h1>Profil</h1>
    <div>
      {{Store.name}}
      </div>
    <h3>Name</h3>


    <div class="username">
         
      <div>
      {{Store.name}}
      </div>
                    <!-- <br>
                    <div>  Email:  {{datar[1]}} </div> -->
            </div>


<!-- Modal -->


<ModalConnection/>
<br/>

<ModalUser v-show="ModalUser" />












  
  </div>
</template>



<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
