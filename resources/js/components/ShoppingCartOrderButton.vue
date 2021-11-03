<template>
    <a role="button" class="btn btn-block btn-primary px-5"
       @click="checkout">Kaufen</a>
</template>

<script>
import {mapActions} from "vuex";

export default {
    name: "ShoppingCartOrderButton",
    methods: mapActions({checkout: 'doCheckout'}),
}
</script>
