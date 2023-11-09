<template>
  
    <div>
      <!-- <button @click="showModal = true">Show Modal</button> -->
      <button type="button" class="btn btn-primary" @click="showModal = true"  >Login</button>
      <custom-modal v-if="showModal">
        <!-- Modal content goes here -->
        <h2>Login</h2>
        <Connection/>
        <button type="button" class="btn btn-danger" @click="showModal = false">close</button>
        <!-- <button @click="showModal = false">Close Modal</button> -->
      </custom-modal>
    </div>
  </template>
  
  <script>
  // Remove this import statement as Vue is typically available globally in a Vue project
  // import Vue from 'vue';
  import Connection from './Connection.vue';

  
  export default {
    name: "ModalConnection",
    data() {
        return {
            showModal: false, // Initially, the modal is hidden
        };
    },
    components: { Connection }
};
  </script>
  