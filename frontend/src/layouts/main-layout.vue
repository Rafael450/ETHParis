<script setup lang="ts">
import { useQuasar } from 'quasar';
import { ref } from 'vue';
import { mdiWalletOutline, mdiChevronDoubleRight, mdiFinance } from '@quasar/extras/mdi-v5';
import logo from  'assets/top-logo.png';

const $q = useQuasar();

$q.dark.set(true);

const leftDrawerOpen = ref(true);



</script>

<template>
    <q-layout view="lHh lpR lFf">
        <q-drawer
            v-model="leftDrawerOpen"
            side="left"
            bordered
        >
            <q-list padding>
                <div class="full-width row justify-center q-mb-md">
                    <q-img
                        :src="logo"
                        style="width: 200px;"
                        alt="Quasar logo"
                        class="q-my-md"
                    />
                </div>

                <q-item
                    v-ripple
                    clickable
                    to="/dashboard"
                    exact
                    dark
                    active-class="selected"
                    class="q-mb-md"
                >
                    <q-item-section avatar>
                        <q-icon
                            :name="mdiWalletOutline"
                            color="accent"
                        />
                    </q-item-section>

                    <q-item-section class="text-weight-bold">
                        Your investements
                    </q-item-section>

                    <q-item-section avatar>
                        <q-icon
                            :name="mdiChevronDoubleRight"
                            color="accent"
                        />
                    </q-item-section>
                </q-item>
                <q-item
                    v-ripple
                    clickable
                    to="/dashboard/funds"
                    exact
                    dark
                    active-class="selected"
                    class="q-mb-md"
                >
                    <q-item-section avatar>
                        <q-icon
                            :name="mdiFinance"
                            color="accent"
                        />
                    </q-item-section>

                    <q-item-section class="text-weight-bold">
                        Investment funds
                    </q-item-section>

                    <q-item-section avatar>
                        <q-icon
                            :name="mdiChevronDoubleRight"
                            color="accent"
                        />
                    </q-item-section>
                </q-item>
                <q-item
                    v-ripple
                    clickable
                    to="/dashboard/create-fund"
                    exact
                    dark
                    active-class="selected"
                >
                    <q-item-section avatar>
                        <q-icon
                            :name="mdiFinance"
                            color="accent"
                        />
                    </q-item-section>

                    <q-item-section class="text-weight-bold">
                        Create fund
                    </q-item-section>

                    <q-item-section avatar>
                        <q-icon
                            :name="mdiChevronDoubleRight"
                            color="accent"
                        />
                    </q-item-section>
                </q-item>
            </q-list>
        </q-drawer>

        <q-page-container>
            <router-view />
        </q-page-container>
    </q-layout>
</template>

<style lang="scss" scoped>
.selected {
    color: $accent;
    border-right: 4px $accent solid;
}
</style>
