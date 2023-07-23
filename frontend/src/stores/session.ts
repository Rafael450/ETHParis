import { useRouter } from 'vue-router';
import { ref } from 'vue';
import { defineStore } from 'pinia';
import { ethers } from 'ethers';

export const useSessionStore = defineStore('session', () => {
    const router = useRouter();

    const provider = ref();
    const loading = ref(true);

    return {
        provider,
        loading,
        async connect() {
            loading.value = true;

            const provider1 = new ethers.providers.Web3Provider(window.ethereum);

            await provider1.send('eth_requestAccounts', []);

            provider.value = provider1;

            const signer = await provider1.getSigner();

            console.log(signer);

            loading.value = false;

            router.replace('/dashboard/create-fund');
        },
    };
});
