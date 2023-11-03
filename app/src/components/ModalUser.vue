<template>
    <div>
      <!-- <button @click="showModal = true">Show Modal</button> -->
      <button type="button" class="btn btn-primary" @click="showModal = true"  >Edit profile</button>
      <custom-modal v-if="showModal">
        <!-- Modal content goes here -->
        <h2>My Modal</h2>
        <EditProfile/>
        <button type="button" class="btn btn-danger" @click="showModal = false">close</button>
        <!-- <button @click="showModal = false">Close Modal</button> -->
      </custom-modal>
    </div>
  </template>
  
  <script>
  // Remove this import statement as Vue is typically available globally in a Vue project
  // import Vue from 'vue';
  import EditProfile from './EditProfile.vue';

  
  export default {
    name: "ModalUser",
    data() {
        return {
            showModal: false, // Initially, the modal is hidden
        };
    },
    components: { EditProfile }
};
  </script>
  