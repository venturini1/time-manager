<template>
  <div class="Profil">
    <h1>Profil</h1>
    <h3>Name</h3>


<!-- Modal -->



<ModalUser v-show="ModalUser" />











  
  </div>
</template>

<script>

import ModalUser from './ModalUser.vue'
export default {
  name: 'UserProfile',
  components: { ModalUser },
  data() {
    return {
      ModalUser: true,
    }
  },

}
</script>

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
