<script setup>
import axios from 'axios';
import ModalUser from './ModalUser.vue';
import ModalConnection from './ModalConnection.vue';
import { ref, onMounted } from 'vue';
import { useStore } from '@/components/Store.js';


const corsOptions = {
  origin: '*',
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  credentials: true,
  optionsSuccessStatus: 204,
  allowedHeaders: 'Content-Type,Authorization',
}

const Store = useStore();

var datar = [];
var datarr = ref(datar);

const setChart = async () => {
    try {
        const response = await axios.get('http://13.36.64.65:4000/api/users/2');
        const chartData = response.data;

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

const postData = async () => {
    try {
        const dataToPost = {
            name: document.getElementById('name').value,
            email: document.getElementById('mail').value,
            role: document.getElementById('role').value,
            password: document.getElementById('password').value,
        };
          console.log(dataToPost)
        // const response = await axios.post('http://13.36.64.65:4000/api/users', dataToPost);
        const response = await axios.post('http://13.36.64.65:4000/api/users', dataToPost, { withCredentials: true });

        console.log('Response from server after posting data:', response.data);
        // Handle the response as needed
    } catch (error) {
        console.error('Error posting data:', error);
    }
};

onMounted(() => {
    setChart();
});
</script>

<template>
    <div>
        <form @submit.prevent="postData">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" placeholder="name">
            </div>
            <div class="mb-3">
                <label for="mail" class="form-label">Email</label>
                <input type="email" class="form-control" id="mail" placeholder="email">
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" class="form-control" id="role" placeholder="role">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" placeholder="password">
            </div>
            <button type="submit"   class="btn btn-primary">Submit</button>
        </form>

        <!-- Your existing template code -->

        <div class="Profil">
            <h1>Profil</h1>
            <div>
                {{ Store.name }}
            </div>

            <!-- Additional content as needed -->

            <ModalConnection/>
            <br/>
            <ModalUser v-show="ModalUser" />
        </div>
    </div>
</template>

<style scoped lang="scss">
    h3 {
        margin: 40px 0 0;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }
</style>
