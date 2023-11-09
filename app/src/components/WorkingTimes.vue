<template>
 
   <div class="dashboard">
    <div class="new">
    <button @click="ouvrirWorkingTime" class="btn btn-primary">NEW</button>
    <WorkingTime v-if="WorkingTimeVisible" @fermer-WorkingTime="fermerWorkingTimeWorkingTime" />
    </div>
    <h1 class="titre">Working Times Dashboard</h1>
    <div></div>
    <!-- <table>
      <tr>
        <th>Widget</th>
      </tr>
      <tr>
        <td>

          <div class="widget">
            <h2>Horaires de Travail</h2>
            <ul>
              <li v-for="WorkingTime in WorkingTimes" :key="WorkingTime.id">
                {{ WorkingTime.startTime }} - {{ WorkingTime.endTime }}
              </li>
            </ul>
          </div>
        </td>
        <td>
 
          <User :userId="userId" />
        </td>
      </tr>
      <tr>
        <td>
   
        </td>
        <td>

          <ClockManager :userId="userId" />
        </td>
      </tr>
    </table> -->
    <!-- <ClockManager :userId="userId" /> -->
  </div>
</template>


<script>

// import WorkingTime from '@/components/WorkingTime.vue';
import ClockManager from '@/components/ClockManager.vue';
import WorkingTime from './WorkingTime.vue';
export default {
  components: {
    ClockManager,
    WorkingTime
  },
  data() {
    return {
      userId: null,
      WorkingTimeVisible: false
    };
  },
  methods: {
    
    ouvrirWorkingTime() {
      this.WorkingTimeVisible = true;
    },
    fermerWorkingTimeWorkingTime() {
      this.WorkingTimeVisible = false;
    },
  
  components: {
    WorkingTime
  }
  },
    getWorkingTimes() {
      // Utiliser Axios ou tout autre moyen pour effectuer une requête API.
      // Mettez à jour le tableau workingTimes avec les données reçues.
      // récupérer le userId de la route.
    },
  


  
};
</script>

<style>

.dashboard {
  text-align: center;
}
.new
{
  /* border: 1px solid #079de2; */
 display: flex;
 justify-content: flex-end;
}
.btn-primary
{

}
.widget {
  border: 1px solid #c81313;
  padding: 10px;
  margin: 10px;
  text-align: left;
}

.titre{
  font-weight: bold;
  font-size: 50px;
  color: rgb(34, 93, 109);
}
</style>


