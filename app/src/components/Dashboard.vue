<template>
 <div class="container">
  <div class="row">
    <div class="col-2"><UserProfile /></div>
    <div class="col-9"><WorkingTimes/> <ModalWorkingTimeVue/> </div>
  </div>
</div>

</template>


<script>
import UserProfile from './UserProfile.vue'
import WorkingTimes from './WorkingTimes.vue'
import ModalWorkingTimeVue from './ModalWorkingTime.vue';
//import WorkingTime from './WorkingTime.vue'

export default {
  name: 'App',
  components: {
    UserProfile,
   // WorkingTime,
    WorkingTimes,
    ModalWorkingTimeVue
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.col-2
{
  border: solid 8px pink;
  margin: 2px;
}
.col-9
{
  border: solid 8px pink;
 
}
.row
{
  position: absolute;
        top: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: 100%;
  border: solid 3px rgb(197, 255, 192);
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}
.container
{
  display: flex;
  justify-content: center;
  background-color: black;
}
</style>
