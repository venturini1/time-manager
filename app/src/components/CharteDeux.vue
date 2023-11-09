<script>
import Chart from 'chart.js/auto';
export default {
    mounted(){
    const ctx = document.getElementById('myChartDeux');



    new Chart(ctx, {
    type: 'doughnut',
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
<template>
    <canvas  id="myChartDeux" ></canvas>
</template>

<style>

</style>