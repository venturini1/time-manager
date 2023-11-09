<script>
import Chart from 'chart.js/auto';
export default {
    mounted(){
    const ctx = document.getElementById('myChartTrois');



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
.styleTrois{
    width: 150px;
    height: 150px;
}
</style>