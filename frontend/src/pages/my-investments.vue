<script setup lang="ts">
import { ethers } from 'ethers';


const provider = new ethers.providers.Web3Provider(window.ethereum);

async function getSigner() {
    console.log(await provider.getSigner());
}

</script>

<template>
    <q-page class="row items-center justify-evenly">
        <!-- <example-component
            title="Example component"
            active
            :todos="todos"
            :meta="meta"
        /> -->
        <q-btn
            flat
            color="primary"
            label="Get signer"
            @click="getSigner"
        />
    </q-page>
</template>
