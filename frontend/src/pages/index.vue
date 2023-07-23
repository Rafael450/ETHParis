<script setup lang="ts">
import logo from  'assets/top-logo.png';
import { useSessionStore } from 'src/stores/session';

const session = useSessionStore();


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
            outline
            style="color: #008d6e; width: 350px;"
            label="Login with metamask"
            no-caps
            rounded
            class="text-h6 q-ma-lg q-py-md"
            @click="session.connect"
        />
    </q-page>
</template>
