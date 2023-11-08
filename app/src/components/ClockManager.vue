<!-- <template>
  <div class="hello">
    <button class="debut" @click="startTimer">Début</button>
    <button class="fin" @click="stopTimer">Fin</button>
    <div class="horaireDebut" v-if="showTime">{{ debutDateTime }}</div>
    <div class="horaireFin" v-if="showTime">{{ finDateTime }}</div>
    <div class="timer" v-if="showTime">{{ timerText }}</div>
  </div>
</template>

<script>
export default {
  name: 'ClockManager',
  data() {
    return {
      showTime: false,
      debutDateTime: '',
      finDateTime: '',
      timer: null,
      startTime: null,
      timerText: '',
    };
  },
  methods: {
    startTimer() {
      this.showTime = true;
      this.debutDateTime = `Début: ${new Date().toLocaleString()}`;
      this.startTime = new Date();

  
      this.timer = setInterval(() => {
        const currentTime = new Date();
        const elapsedTime = currentTime - this.startTime;
        const seconds = Math.floor(elapsedTime / 1000);

        this.debutDateTime = `Début: ${new Date().toLocaleString()}`;
        this.timerText = `Timer: ${seconds} seconds`;
      }, 1000); 
    },
    stopTimer() {
      this.showTime = true;


      clearInterval(this.timer);

      this.finDateTime = `Fin: ${new Date().toLocaleString()}`;
    },
  },
};
</script>

<style>

</style> -->


<template>
  <div class="hello">

    
    <button type="button" class=" clock btn btn-primary" @click="toggleClock">{{ isActive ? 'Stop Clock' : 'Start Clock' }}</button>
    <div class="debut"> Debut :{{ isActive ? debutTime : '' }}</div>
    <div class="fin"> Fin :{{ !isActive ? finTime : '' }}</div>
    <div class="timer"> Timer :{{ isActive ? timer : '' }}</div>

    <ul class="horraire">
      <li v-for="(log, index) in logData" :key="index">{{ log }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isActive: false,
      debutTime: '',
      finTime: '',
      timer: 0,
      intervalId: null,
      logData: [], // Store log data for the <ul> element
    };
  },
  methods: {
    toggleClock() {
      if (this.isActive) {
        // Stop the clock
        clearInterval(this.intervalId);
        this.finTime = new Date().toLocaleString();
        // Add log data to the list
        this.logData.push(`Debut: ${this.debutTime}, Fin: ${this.finTime}, Timer: ${this.timer} seconds`);
      } else {
        // Start the clock
        this.debutTime = new Date().toLocaleString();
        this.intervalId = setInterval(() => {
          this.timer++;
        }, 1000);
      }
      this.isActive = !this.isActive;
    },
  },
};
</script>

<style>
/* Add your CSS styles here */
</style>
