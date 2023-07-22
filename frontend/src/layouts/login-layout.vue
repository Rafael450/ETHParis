<script setup lang="ts">
import { useQuasar } from 'quasar';
import { ref } from 'vue';

const $q = useQuasar();

$q.dark.set(true);

</script>

<template>
    <q-layout view="lHh lpR lFf">
        <q-page-container>
            <router-view />
        </q-page-container>
    </q-layout>
</template>
