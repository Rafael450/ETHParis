import { RouteRecordRaw } from 'vue-router';

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        component: () => import('layouts/login-layout.vue'),
        children: [
            {
                path: '', component: () => import('pages/index.vue'),
            },

        ],
    },
    {
        path: '/dashboard',
        component: () => import('layouts/main-layout.vue'),
        children: [
            {
                path: '', component: () => import('pages/my-investments.vue'),
            },
            {
                path: 'funds', component: () => import('pages/funds.vue'),
            },
            {
                path: 'create-fund', component: () => import('pages/create-fund.vue'),
            },
        ],
    },

    // Always leave this as last one,
    // but you can also remove itfunds
    {
        path: '/:catchAll(.*)*',
        component: () => import('pages/ErrorNotFound.vue'),
    },
];

export default routes;
