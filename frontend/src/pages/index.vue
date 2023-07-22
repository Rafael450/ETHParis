<script setup lang="ts">
import logo from  'assets/top-logo.png';
import { Todo, Meta } from 'components/models';
import ExampleComponent from 'components/ExampleComponent.vue';
import { ref } from 'vue';

</script>

<template>
    <q-page class="column items-center justify-center">
        <q-img
            :src="logo"
            style="width: 350px;"
            alt="ChainFunds logo"
            class="q-my-md"
        />
        <q-btn
            style="background: #008d6e; color: white; width: 350px;"
            label="Login with Google"
            no-caps
            rounded
            class="text-h6 q-ma-lg q-py-md"
            @click="()=>{}"
        />
        <q-btn
            outline
            style="color: #008d6e; width: 350px;"
            label="Login with metamask"
            no-caps
            rounded
            class="text-h6 q-ma-lg q-py-md"
            @click="()=>{}"
        />
    </q-page>
</template>
