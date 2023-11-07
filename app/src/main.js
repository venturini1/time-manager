import { createApp } from 'vue'
import App from './App.vue'
import PrimeVue from 'primevue/config';
import Button from "primevue/button";
import CascadeSelect from 'primevue/cascadeselect';
import Dialog from 'primevue/dialog';


import 'primevue/resources/themes/lara-light-teal/theme.css'

// createApp(App).mount('#app')
const app = createApp(App);
app.use(PrimeVue);
app.component('pButton',Button)
app.component('pCascadeSelect',CascadeSelect)
app.component('pDialog', Dialog);
app.mount('#app')
 
