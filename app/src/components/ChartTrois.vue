<script>
import Chart from 'chart.js/auto';
export default {
    mounted(){
    const ctx = document.getElementById('myChartTrois');

    ctx.height = 10; // Hauteur en pixels
    ctx.width = 40;

    new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  },


}

</script>
<template >
 
<canvas  id="myChartTrois" ></canvas>

    
</template>

<style>

</style>