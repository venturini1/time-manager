<script setup>
import axios from 'axios';
import { onMounted, reactive, ref, watch } from 'vue';
//import ProductService from '@/service/ProductService';

import { useLayout } from '@/layout/composables/layout';

const { isDarkTheme } = useLayout();

var datar = []
var datarr = ref(datar);
const products = ref(null);
const barData = ref(null);
//const axios = require('axios'); // Make sure to import Axios or use it according to your project setup

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

console.log('bi');
console.log(datar[0]);
setChart();

const lineData = reactive({
    labels: [datarr.value, 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [
        {
            label: 'First Dataset',
            data : [12, 23, 34, 34, 23],
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


const items = ref([
    { label: 'Add New', icon: 'pi pi-fw pi-plus' },
    { label: 'Remove', icon: 'pi pi-fw pi-minus' }
]);
const lineOptions = ref(null);
/*const productService = new ProductService();

onMounted(() => {
    productService.getProductsSmall().then((data) => (products.value = data));
});*/

const formatCurrency = (value) => {
    return value.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
};


const applyLightTheme = () => {
    lineOptions.value = {
        plugins: {
            legend: {
                labels: {
                    color: '#495057'
                }
            }
        },
        scales: {
            x: {
                ticks: {
                    color: '#495057'
                },
                grid: {
                    color: '#ebedef'
                }
            },
            y: {
                ticks: {
                    color: '#495057'
                },
                grid: {
                    color: '#ebedef'
                }
            }
        }
    };
};

const applyDarkTheme = () => {
    lineOptions.value = {
        plugins: {
            legend: {
                labels: {
                    color: '#ebedef'
                }
            }
        },
        scales: {
            x: {
                ticks: {
                    color: '#ebedef'
                },
                grid: {
                    color: 'rgba(160, 167, 181, .3)'
                }
            },
            y: {
                ticks: {
                    color: '#ebedef'
                },
                grid: {
                    color: 'rgba(160, 167, 181, .3)'
                }
            }
        }
    };
};
const visible = ref(false);

watch(
    isDarkTheme,
    (val) => {
        if (val) {
            applyDarkTheme();
        } else {
            applyLightTheme();
        }
    },
    { immediate: true }
);
</script>

<template>
    <div class="grid">

        <div class="col-12 lg:col-6 xl:col-3">

        </div>
        <div class="col-12 lg:col-6 xl:col-3">


        </div>
        <div class="col-12 lg:col-6 xl:col-3">

        </div>

        <div class="col-12 xl:col-6">

        <template>
    
    <div class="card flex justify-content-center">
        <Button type="button" label="Ajouter-Widgets" icon="pi pi-ellipsis-v" :loading="loading" @click="load" />
        <Button type="button" label="Suprimer-Widegets" icon="pi pi-ellipsis-v" :loading="loading" @click="load" />
        
        <div>
            <button @click="ouvrirWorkingTime">Afficher le pop-up</button>
            <WorkingTime v-if="WorkingTimeVisible" @fermer-WorkingTime="fermerWorkingTimeWorkingTime" />
        </div>
        
    </div>
    
</template>





        </div>
        <div class="card">
                <h5>Linear Chart</h5>
                <Chart type="line" :data="lineData" :options="lineOptions"></Chart>
        </div>
        <div class="card">
                <h5>Linear Chart</h5>
                <Chart type="pie" :data="lineData1" :options="lineOptions"></Chart>
        </div>
        <div class="col-12 xl:col-6">

            <div id="app">
                {{ info }}
            </div>
            

    <div class="card flex justify-content-center">
        <Button label="Show" icon="pi pi-external-link" @click="visible = true" />
        <Dialog v-model:visible="visible" modal header="Header" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
            <template #header>
                <div class="inline-flex align-items-center justify-content-center gap-2">
                    <Avatar image="https://primefaces.org/cdn/primevue/images/avatar/amyelsner.png" shape="circle" />
                    <span class="font-bold white-space-nowrap">Amy Elsner</span>
                </div>
            </template>
            <p class="m-0">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <template #footer>
                <Button label="Ok" icon="pi pi-check" @click="visible = false" autofocus />
            </template>
        </Dialog>
    </div>






            <!-- <div
                class="px-4 py-5 shadow-2 flex flex-column md:flex-row md:align-items-center justify-content-between mb-3"
                style="border-radius: 1rem; background: linear-gradient(0deg, rgba(0, 123, 255, 0.5), rgba(0, 123, 255, 0.5)), linear-gradient(92.54deg, #1c80cf 47.88%, #ffffff 100.01%)"
            >
                <div>
                    <div class="text-blue-100 font-medium text-xl mt-2 mb-3">TAKE THE NEXT STEP</div>
                    <div class="text-white font-medium text-5xl">Try PrimeBlocks</div>
                </div>
                <div class="mt-4 mr-auto md:mt-0 md:mr-0">
                    <a href="https://www.primefaces.org/primeblocks-vue" class="p-button font-bold px-5 py-3 p-button-warning p-button-rounded p-button-raised"> Get Started </a>
                </div>
            </div> -->
        </div>
    </div>
</template>

