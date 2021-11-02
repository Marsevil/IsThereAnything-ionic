import { createRouter, createWebHistory } from "@ionic/vue-router";
import { RouteRecordRaw } from "vue-router";

const routes: Array<RouteRecordRaw> = [
    {
        path: "",
        redirect: "/stock",
    },
    {
        path: "/stock",
        component: () => import("../views/Stock.vue"),
    },
    // {
    //     path: "/stock/new",
    //     component: () => import("../views/CreateStock.vue"),
    // },
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;
