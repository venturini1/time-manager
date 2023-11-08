<template>
  <div class="container">
    <div class="row">
      <div class="col-2"><UserProfile /></div>
      <div class="col-9">
        <div class="intraContainer">
          <WorkingTimes/> 
          <pButton label="Submit" />
          <EditableDashboard/>
          
          
          
          
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
          
          <div class="card">
                <h5>Linear Chart</h5>
                <Chart type="line" :data="lineData" :options="lineOptions"></Chart>
          </div>
          <Chart type="bar" :data="chartData" :options="chartOptions" />
          <button
          type="button"
          class="inline-flex items-center rounded border text-sm font-medium text-slate-200 shadow-sm focus:outline-none"
          :class="{
            'px-6 py-3': size === 'lg',
            'px-4 py-2': size === 'md',
            'px-2.5 py-1.5': size === 'sm',
            'border-blue-500 bg-blue-500 hover:bg-blue-600 hover:border-blue-600':
            variant === 'primary',
            'border-red-500 bg-red-500 text-red-500 hover:bg-red-600 hover:border-red-600':
            variant === 'error',
            'bg-transparent hover:bg-transparent': outline,
          }"
          >
          <slot />
        </button>
        <Chart type="bar" :data="chartData" :options="chartOptions" />
        
        <!-- <div class="p-8 bg-slate-900 min-h-screen">
          <div class="py-2 px-2.5 flex justify-end space-x-2">
            <Button v-if="isEditing" @click="addWidget">Add Widget</Button>
            <Button @click="toggleEdit" outline>
              {{ isEditing ? "Stop Editing" : "Start Editing" }}
            </Button>
          </div>
          <div class="grid-stack">
            <Widget
            v-for="widget in widgets"
            :key="widget.id"
            :data="widget"
            :is-editing="isEditing"
            @delete="deleteWidget"
            />
          </div>
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
import Chart from 'chart.js'
// import { ref, onMounted } from 'vue';
import { onMounted, reactive, ref, watch } from 'vue';
import { useLayout } from '@/layout/composables/layout';

import EditableDashboard from "./EditableDashboard.vue";
// import { CustomerService } from '@/service/CustomerService';
//import WorkingTime from './WorkingTime.vue'

// import Widget from "..Widget.vue";
import Button from "../components/Button.vue";
import { GridStack } from "gridstack";
// import "gridstack/dist/gridstack.min.css";
// import "gridstack/dist/gridstack-extra.min.css"

const grid = ref(null);
const widgets = ref([
{
  id: 1,
  title: "Widget 1",
  grid: {
    x: 0,
    y: 0,
    w: 2,
    h: 2,
  },
},
{
  id: 2,
  title: "Widget 2",
  grid: {
    x: 2,
    y: 0,
    w: 2,
    h: 1,
  },
},
{
  id: 3,
  title: "Widget 3",
  grid: {
    x: 0,
    y: 2,
    w: 2,
    h: 1,
  },
},
{
  id: 4,
  title: "Widget 4",
  grid: {
    x: 2,
    y: 2,
    w: 1,
    h: 2,
  },
},
{
  id: 5,
  title: "Widget 5",
  grid: {
    x: 3,
    y: 2,
    w: 1,
    h: 2,
  },
},
]);

const items = ref([
{ label: 'Add New', icon: 'pi pi-fw pi-plus' },
{ label: 'Remove', icon: 'pi pi-fw pi-minus' }
]);
const lineOptions = ref(null);


const setChart = async () => {
    try {
        const response = await axios.get('https://catfact.ninja/fact'); // Replace with your API endpoint
        const chartData = response.data;

        //JSON.parse(chartData)
        //console.log(chartData.fact)
        // Assuming chartData has a similar structure to what you had
        /*barData.value = {
            labels: chartData.labels,
            datasets: chartData.datasets,
        };*/
        console.log(chartData.length);
        datar[0] = chartData.fact;
        datarr.value = datar[0];
        console.log(datar);
        console.log('bonjour');
    } catch (error) {
        console.error('Error fetching chart data:', error);
    }
};

const lineData1 = reactive({
    labels: ['Januaryyy', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [
        {
            label: 'First Dataset',
            data: [65, 59, 80, 81, 56, 55, 40],
            fill: false,
            backgroundColor: 'red',
            borderColor: '#2f4860',
            tension: 0.4
        },
        {
            label: 'Second Dataset',
            data: [28, 48, 40, 19, 86, 27, 90],
            fill: false,
            backgroundColor: '#00bb7e',
            borderColor: '#00bb7e',
            tension: 0.4
        }
    ]
});

function initGridStack() {
  grid.value = GridStack.init({
    column: 4,
    cellHeight: 100,
    margin: 10,
    disableResize: !isEditing.value,
    disableDrag: !isEditing.value,
  });
  makeWidgets(widgets.value);
}

function makeWidgets(widgets) {
  widgets.forEach((widget) => {
    makeWidget(widget);
  });
}
function makeWidget(item) {
  const elSelector = `#${item.id}`;
  return grid.value.makeWidget(elSelector);
}

async function addWidget() {
  const widgetCount = widgets.value.length + 1;
  const widget = {
    id: widgetCount,
    title: `Widget ${widgetCount}`,
    grid: {
      w: 1,
      h: 1,
    },
  };
  widgets.value.push(widget);
  await nextTick();
  makeWidget(widget);
}


function deleteWidget(widget) {
  const index = widgets.value.findIndex((w) => w.id === widget.id);
  if (index === -1) {
    return;
  }
  // const selector = `#${CSS.escape(widget.id)}`;
  grid.value.removeWidget(selector);
  grid.value.compact();
  widgets.value.splice(index, 1);
}

function toggleEdit() {
  if (isEditing.value) {
    grid.value.disable();
  } else {
    grid.value.enable();
  }
  isEditing.value = !isEditing.value;
}
onMounted(() => {
  initGridStack();
});

















//PART 2



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
    ModalWorkingTimeVue,
    EditableDashboard,
    Chart
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

