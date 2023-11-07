<template>
 <div class="container">
  <div class="row">
    <div class="col-2"><UserProfile /></div>
    <div class="col-9">
      <div class="intraContainer">
        <WorkingTimes/> 
        <pButton label="Submit" />





        <!-- <div class="card">
        <Button label="Show" icon="pi pi-external-link" @click="dialogVisible = true" />

        <pDialog v-model:visible="dialogVisible" header="Flex Scroll" :style="{ width: '75vw' }" maximizable modal :contentStyle="{ height: '300px' }">
            <DataTable :value="customers" scrollable scrollHeight="flex" tableStyle="min-width: 50rem">
                <Column field="name" header="Name"></Column>
                <Column field="country.name" header="Country"></Column>
                <Column field="representative.name" header="Representative"></Column>
                <Column field="company" header="Company"></Column>
            </DataTable>
            <template #footer>
                <Button label="Ok" icon="pi pi-check" @click="dialogVisible = false" />
            </template>
        </pDialog>
    </div> -->










        
        <ModalWorkingTimeVue/>
      </div>  
    </div>
   
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


// import { ref, onMounted } from 'vue';
// import { CustomerService } from '@/service/CustomerService';

// const customers = ref();
// const _dialogVisible = ref(false); // Use an underscore to indicate it's intentionally unused

// onMounted(() => {
//     CustomerService.getCustomersMedium().then((data) => {
//         customers.value = data;
//     });
// });

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.col-2
{
  border: solid 1px rgb(150, 36, 36);
  margin: 10px;
  border-radius: 20px;
}
.col-9
{
  border: solid 1px rgb(0, 0, 0);
  border-radius: 20px;
  margin: 10px;
  padding: 10px;
 
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

.intraContainer{
  border: 1px solid black;
}
</style>
