<script setup>
import { ref, onMounted } from 'vue';
import CountryService from '@/service/CountryService';

const countries = ref([]);
const cities = ref([
    { name: 'New York', code: 'NY' },
    { name: 'Rome', code: 'RM' },
    { name: 'London', code: 'LDN' },
    { name: 'Istanbul', code: 'IST' },
    { name: 'Paris', code: 'PRS' }
]);
const filteredCountries = ref(null);
const value1 = ref(null);
const value2 = ref(null);
const value3 = ref(null);
const value4 = ref(null);
const value5 = ref(null);
const value6 = ref(null);
const value7 = ref(null);
const value8 = ref(null);
const value9 = ref(null);
const value10 = ref(null);
const countryService = new CountryService();

onMounted(() => {
    countryService.getCountries().then((data) => (countries.value = data));
});

const searchCountry = (event) => {
    //in a real application, make a request to a remote url with the query and return filtered results, for demo we filter at client side
    const filtered = [];
    const query = event.query;
    for (let i = 0; i < countries.value.length; i++) {
        const country = countries.value[i];
        if (country.name.toLowerCase().indexOf(query.toLowerCase()) == 0) {
            filtered.push(country);
        }
    }
    filteredCountries.value = filtered;
};
</script>

<template>
    <div class="card">
      
   
    </div>
</template>
