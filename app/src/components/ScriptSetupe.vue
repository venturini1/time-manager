<script setup>

import axios from 'axios';

var datar = []
var datarr = ref(datar);

const setChart = async () => {
    try {
        const response = await axios.get('http://localhost:4000/api/users/2'); // Replace with your API endpoint
        const chartData = response.data;

        //JSON.parse(chartData)
        //console.log(chartData.fact)
        // Assuming chartData has a similar structure to what you had
        /*barData.value = {
            labels: chartData.labels,
            datasets: chartData.datasets,git 
        };*/
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



</script>

<template>
    <div>
    {{Store.name}}
    </div>


</template>