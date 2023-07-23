<script setup lang="ts">
import { ethers } from 'ethers';
import { ref } from 'vue';
import { useQuasar } from 'quasar';

const $q = useQuasar();

const provider = new ethers.providers.Web3Provider(window.ethereum);

const name = ref('');

const minInvestment = ref('');

const token1 = ref('Choose token you will be able to trade');

const token2 = ref('Choose token you will be able to trade');

const options = [
    'USDC', 'MATIC',
];

const loading = ref(false);

async function create() {
    loading.value = true;

    const signer = provider.getSigner();
    console.log(signer);

    const contract = new ethers.Contract(
        '0x037f6a573aC359F32A132336eED30bA39c9405dB',
        [
            'function mint(address to, address[] memory funds) public',
        ],
        signer
    );
    const address = await signer.getAddress();
    console.log(address);
    const mint = await contract.mint(
        address,
        [
            '0x037f6a573aC359F32A132336eED30bA39c9405dB',
            '0x037f6a573aC359F32A132336eED30bA39c9405dB',
        ]
    );

    const receipt = await provider.waitForTransaction(
        mint.hash
    );
    console.log(receipt);

    loading.value = false;

    $q.notify({
        type: 'positive',
        message: 'Created successfully!',
    });

}

</script>

<template>
    <q-page class="column items-start justify-start q-pa-xl">
        <div class="text-h2 text-weight-bold q-mb-xl">
            Create Fund
        </div>
        <q-input
            v-model="name"
            autofocus
            color="accent"
            label="Fund name"
            style="width: 30%;"
            class="q-mb-lg"
        />
        <q-input
            v-model="name"
            autofocus
            color="accent"
            label="Mininum investment"
            style="width: 30%;"
            class="q-mb-lg"
        />
        <q-select
            v-model="token1"
            outlined
            color="accent"
            :options="options"
            label="Outlined"
            class="q-mb-lg"
        />
        <q-select
            v-model="token2"
            outlined
            color="accent"
            :options="options"
            label="Outlined"
            class="q-mb-lg"
        />
        <q-btn
            style="background: #008d6e; color: white; width: 150px;"
            no-caps
            class="text-subtitle1 q-py-md"
            :loading="loading"
            @click="create"
        >
            <template #loading>
                <q-spinner color="white" />
            </template>
            Create
        </q-btn>
    </q-page>
</template>
