<script setup lang="ts">
import { ref } from 'vue';
import { Todo, Meta } from './models';
import { ethers } from 'ethers';
import { useQuasar } from 'quasar';

const $q = useQuasar();

interface Props {
    name: string;
    tokens?: Todo[];
    meta: Meta;
    active: boolean;
}
// defineProps<Props>();

const dialog = ref(false);
const address = ref(0);
const loading = ref(false);
const provider = new ethers.providers.Web3Provider(window.ethereum);

async function invest(value: number) {
    loading.value = true;

    const signer = provider.getSigner();
    console.log(signer);

    const amount = ethers.utils.parseEther(value.toString());


    const contract = new ethers.Contract(
        '0xE3b8413838D37b17be11F48bdf981FDb51ADc3bC',
        [
            'function deposit(uint256 tokenId) public payable',
        ],
        signer
    );
    const address = await signer.getAddress();
    console.log(address);

    const mint = await contract.deposit(
        0,
        {
            value: amount,
        }
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
    <q-card class="card q-ma-xl">
        <q-card-section class="text-weight-bold text-h6">
            Ferroca's fund
        </q-card-section>
        <q-card-section class="text-subtitle2">
            <div><span class="text-weight-bold">Owner's address</span>: 0x8c245bE862E6D5e9c44c7c31D0d5340c8Aa03e44</div>
        </q-card-section>
        <q-card-section class="text-subtitle2">
            <div><span class="text-weight-bold">Minimal aport</span>: 0.01xDAI</div>
        </q-card-section>
        <q-card-section class="text-subtitle2">
            <div><span class="text-weight-bold">Holding tokens</span>: USDT, xDAI</div>
        </q-card-section>
        <q-card-section class="text-subtitle2">
            <div><span class="text-weight-bold">Burning time</span>: 6 days</div>
        </q-card-section>
        <q-card-section class="text-subtitle2">
            <div><span class="text-weight-bold">Managent tax</span>: 5% of profits</div>
        </q-card-section>
        <q-card-actions
            align="evenly"
            class="text-white"
        >
            <q-btn
                outline
                style="color: #008d6e; width: 150px;"
                no-caps
                class="text-subtitle1 q-ma-lg q-py-md"
            >
                More Info
            </q-btn>
            <q-btn
                style="background: #008d6e; color: white; width: 150px;"
                no-caps
                class="text-subtitle1 q-ma-lg q-py-md"
                @click="dialog = true"
            >
                Invest
            </q-btn>
        </q-card-actions>
        <q-dialog
            v-model="dialog"
            persistent
        >
            <q-card style="min-width: 350px">
                <q-card-section>
                    <div class="text-h6">
                        Amount to invest
                    </div>
                </q-card-section>
                <q-card-section class="q-pt-none">
                    <q-input
                        v-model="address"
                        dense
                        autofocus
                        color="accent"
                        @keyup.enter="dialog = false"
                    />
                </q-card-section>

                <q-card-actions
                    align="right"
                    class="text-accent"
                >
                    <q-btn
                        v-close-popup
                        flat
                        color="accent"
                        label="Cancel"
                    />
                    <q-btn
                        v-close-popup
                        flat
                        color="accent"
                        :loading="loading"
                        @click="invest(address)"
                    >
                        <template #loading>
                            <q-spinner
                                size="24px"
                                color="white"
                            />
                        </template>
                        invest
                    </q-btn>
                </q-card-actions>
            </q-card>
        </q-dialog>
    </q-card>
</template>

<style scoped lang="scss">
.card{
    width: 60%;
}

</style>
