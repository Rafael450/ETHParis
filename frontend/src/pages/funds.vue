<script setup lang="ts">
import FundCard from 'components/fund-card.vue';
import { onMounted, ref } from 'vue';
import { ethers } from 'ethers';

const provider = new ethers.providers.Web3Provider(window.ethereum);

const loading = ref(false);

const count = ref(0);

onMounted(async () => {
    loading.value = true;

    const signer = provider.getSigner();
    console.log(signer);

    const contract = new ethers.Contract(
        '0xE3b8413838D37b17be11F48bdf981FDb51ADc3bC',
        [
            'function tokens() view returns (uint256)',
        ],
        signer
    );

    const bigNumberValue = await contract.tokens();

    count.value = Number(bigNumberValue);

    console.log(count.value);

    loading.value = false;
});


</script>

<template>
    <q-page class="column items-start justify-start q-pa-xl">
        <div class="text-h2 text-weight-bold">
            All funds available
        </div>
        <div
            v-if="loading"
            class="full-width row justify-center items-center full-height q-mt-xl"
        >
            <q-spinner
                size="50px"
                color="accent"
            />
        </div>
        <fund-card
            v-for="n in count"
            v-else
            :key="n"
        />
    </q-page>
</template>
