<template>
<div class="body">
  <div class="Working-Time">
      <form class="Name">
        <label for="floatingInputValue" class="title">Name</label>
        <input type="text" class="form-control" id="floatingInputValue" placeholder="Name">  
      </form>
      <label for="floatingInputValue" class="title">DATA</label>
      <div class="data">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="clocks">
            <label class="form-check-label" for="clocks">Clocks</label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="start" >
            <label class="form-check-label" for="start">Start</label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="end">
            <label class="form-check-label" for="end">End</label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" value="" name="flexRadioDefault" id="day" >
            <label class="form-check-label" for="day">Day</label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" value="" name="flexRadioDefault" id="week">
            <label class="form-check-label" for="week">Week</label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" value="" name="flexRadioDefault" id="month" >
            <label class="form-check-label" for="month">Month</label>
          </div>
      </div>
      <label for="floatingInputValue" class="title" >Style</label>
    <div class="icones">
      <div class="icone">
            <input class="input" type="radio"  name="radios" id="radio1" >
            <label class="label" for="radio1"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/></svg></label>
      </div>
      <div class="icone">
            <input class="input" type="radio"  name="radios" id="radio2">
            <label class="label" for="radio2"><svg   xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pie-chart" viewBox="0 0 16 16">
            <path d="M7.5 1.018a7 7 0 0 0-4.79 11.566L7.5 7.793V1.018zm1 0V7.5h6.482A7.001 7.001 0 0 0 8.5 1.018zM14.982 8.5H8.207l-4.79 4.79A7 7 0 0 0 14.982 8.5zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/></svg></label>
      </div>
      <div class="icone">
            <input class="input" type="radio" name="radios" id="radio3" >
            <label class="label" for="radio3"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-graph-up" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0Zm14.817 3.113a.5.5 0 0 1 .07.704l-4.5 5.5a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61 4.15-5.073a.5.5 0 0 1 .704-.07Z"/></svg></label>
      </div>
    </div>
    <div class="button popup">
        <div class="space">
          <button class="btn btn-primary" type="submit" @click="fermerWorkingTime" >Cancel</button>
          <button class="btn btn-primary" type="submit" @click="fermerWorkingTime" >OK</button>
        </div>
    </div>
</div>
</div>
</template>

<script>
export default {
  methods: {
    fermerWorkingTime() {
      this.$emit('fermer-WorkingTime'); 
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.body
{
  position: absolute;
        top: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: 100%;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center; 
}
.Working-Time
{
  //border: solid 2px rgb(251, 255, 0);
  background-color: rgb(243, 243, 243);
  border-radius: 1em;
  padding: 1em;
  width: 40%;
  height: 55%;
}
.title
{
  font-size: 2em;
  margin-top: 1em;
  border-top: solid 1px gray;
  width: 95%;
}
.data
{
  display: grid;
  grid-template-columns: 10em 10em 10em;
  align-content: center;
  flex-wrap: nowrap; 
  justify-content: center; 
  //background-color: aliceblue;
  //border: solid 3px blue;
  

}
.form-check
{
  height: 3em;
  //border: solid 2px black;
  background-color: rgb(230, 226, 224);
  margin: 0.1em;
  border-radius: 0.5em;
  display: flex;
  align-items: center;
  flex-wrap: nowrap; 
  justify-content: space-around; 
  padding: 0 2em 0 2em; 
  
}
.icones
{
  //border: solid 2px black;
  height: 4em;
  display: grid;
  grid-template-columns: 10em 10em 10em;
  align-content: center;
  flex-wrap: nowrap; 
  justify-content: center;
}
.icone
{
  //border: solid 2px black;
  margin: 1em;
}
.bi-bar-chart, .bi-pie-chart, .bi-graph-up
{
  height: 3em;
  width: auto;
  margin-left: 1em;
  //border: solid 2px black;
}
.button
{
  display: flex;
  align-items: center; 
  justify-content: flex-end;
  padding: 1em;
  height: 5em;
}
.space
{
  //border: solid 2px rgb(12, 102, 0);
  height: 2.5em;
  width: 9em;
  display: flex;
  align-content: center; 
  justify-content: space-between;
}


</style>
