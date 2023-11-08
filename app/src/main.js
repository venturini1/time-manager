import { createApp } from 'vue'
import App from './App.vue'
import PrimeVue from 'primevue/config';
import Button from "primevue/button";
import CascadeSelect from 'primevue/cascadeselect';
import Dialog from 'primevue/dialog';
import DialogService from 'primevue/dialogservice';
import { createPinia } from 'pinia'


import 'primevue/resources/themes/lara-light-teal/theme.css'
const pinia = createPinia()

// createApp(App).mount('#app')
const app = createApp(App);
app.use(PrimeVue);
app.use(DialogService);
app.use(pinia);
app.component('pButton',Button)
app.component('pCascadeSelect',CascadeSelect)
app.component('pDialog', Dialog);
app.mount('#app')

