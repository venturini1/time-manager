<template>
    <div>
      <!-- <button @click="showModal = true">Show Modal</button> -->
      <!-- <button type="button" class="btn btn-primary" @click="showModal = true"  >Ajout Dashboard</button>-->
      <custom-modal v-if="showModal">
        <!-- Modal content goes here -->
        <h2>My Modal</h2>
        <WorkingTime/>
        <button type="button" class="btn btn-danger close" @click="showModal = false">Close modal</button>
        <!-- <button @click="showModal = false">Close Modal</button> -->
      </custom-modal>
    </div>
  </template>
  
  <script>
  // Remove this import statement as Vue is typically available globally in a Vue project
  // import Vue from 'vue';
  import WorkingTime from './WorkingTime.vue';

  
  export default {
    name: "ModalWorkingTime",
    data() {
        return {
            showModal: false, // Initially, the modal is hidden
        };
    },
    components: { WorkingTime }
};
  </script>
  
  