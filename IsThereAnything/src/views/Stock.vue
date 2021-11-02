<template>
  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button color="primary"></ion-menu-button>
        </ion-buttons>
        <ion-title> Stock List </ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content :fullscreen="true">
      <ion-list v-if="stocks && stocks.length > 0">
        <ion-item v-for="stock in stocks" :key="stock.id">
          {{ stock.name }}
        </ion-item>
      </ion-list>
      <div v-else id="container">
        <strong class="capitalize">Aucun stock trouvé</strong>
      </div>

      <ion-fab vertical="bottom" horizontal="end" slot="fixed">
        <ion-fab-button router-link="/stock/new">
          <ion-icon :icon="add"></ion-icon>
        </ion-fab-button>
      </ion-fab>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { MStock, Stock } from "../models/MStock";

import {
  IonButtons,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar,
  IonFab,
  IonFabButton,
  IonIcon,
} from "@ionic/vue";
import { defineComponent } from "vue";

import { add } from "ionicons/icons";

export default defineComponent({
  name: "Stock",
  components: {
    IonButtons,
    IonContent,
    IonHeader,
    IonMenuButton,
    IonPage,
    IonTitle,
    IonToolbar,
    IonFab,
    IonFabButton,
    IonIcon,
  },

  setup: () => ({
    add,
  }),

  data: () => ({
    stocks: [] as Stock[],
  }),

  updated() {
    const model = new MStock();
    model.getStockList().then((values) => {
      this.stocks = values;
    });
  },
});
</script>

<style scoped>
#container {
  text-align: center;
  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;
  color: #8c8c8c;
  margin: 0;
}

#container a {
  text-decoration: none;
}
</style>