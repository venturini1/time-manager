<template>
 <div class="container">
  <div class="row">
    <div class="col-2"><UserProfile /></div>
    <div class="col-9">
      <div class="intraContainer">
        <WorkingTimes/> 
        <pButton label="Submit" />




        <div class="card flex justify-content-center">
                <Button label="Show" icon="pi pi-external-link" @click="visible = true" />
                <Dialog v-model:visible="visible" modal header="Header" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
                    <template #header>
                        <div class="inline-flex align-items-center justify-content-center gap-2">
                           
                           
                        </div>
                    </template>
                   
                    <Carousel :value="products2" :numVisible="3" :numScroll="1" :responsiveOptions="responsiveOptions" circular :autoplayInterval="3000">
                        <template #item="slotProps">
                            <div class="border-1 surface-border border-round m-2 text-center py-5 px-3">
                                <div class="mb-3">
                                    <img :src="'https://primefaces.org/cdn/primevue/images/product/' + slotProps.data.image" :alt="slotProps.data.name" class="w-6 shadow-2" />
                                </div>
                                <div>
                                    <h4 class="mb-1">{{ slotProps.data.name }}</h4>
                                    <h6 class="mt-0 mb-3">${{ slotProps.data.price }}</h6>
                                    <Tag :value="slotProps.data.inventoryStatus" :severity="getSeverity(slotProps.data.inventoryStatus)" />
                                    <div class="mt-5 flex align-items-center justify-content-center gap-2">
                                        <Button icon="pi pi-search" rounded />
                                        <Button icon="pi pi-star-fill" rounded severity="secondary" />
                                    </div>
                                </div>
                            </div>
                        </template>
                    </Carousel>
                   
                   
                   
                    <template #footer>
                        <Button label="Ok" icon="pi pi-check" @click="visible = false" autofocus />
                    </template>
                   
                   
                </Dialog>
            </div>









        
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
import { ref, onMounted } from 'vue';
// import { CustomerService } from '@/service/CustomerService';

//import WorkingTime from './WorkingTime.vue'


const customers = ref();
const visible = ref(false);

onMounted(() => {
    CustomerService.getCustomersMedium().then((data) => {
        customers.value = data;
    });
});



export default {
  name: 'App',
  components: {
    UserProfile,
   // WorkingTime,
    WorkingTimes,
    ModalWorkingTimeVue
  }
}




// const customers = ref();
// const dialogVisible = ref(false); // Use an underscore to indicate it's intentionally unused

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
