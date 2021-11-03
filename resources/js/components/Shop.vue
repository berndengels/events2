<template>
    <div class="w-100">
        <Products :products='products' />
        <!--div id="card-element"></div-->
        <div v-if="hasCart">
            <ShoppingCartDestroyButton />
            <ShoppingCart />
            <ShoppingCartLoginButtons v-if="guest"
                :route-login="routeLogin"
                :route-register="routeRegister"
            />
            <ShoppingCartOrderButton v-else />
            <div v-if="getCheckout">
                <StripeCheckout
                    ref="checkoutRef"
                    mode="payment"
                    :pk="apiToken"
                    :line-items="lineItems"
                    :success-url="successUrl"
                    :cancel-url="cancelUrl"
                    @loading="v => loading = v"
                />
                <button @click="submit">Pay now!</button>
            </div>
        </div>

    </div>
</template>

<script>
import Vue from "vue";
import { mapActions, mapState } from "vuex"
import Products from "./Products";
import ShoppingCart from "./ShoppingCart";
import ShoppingCartDestroyButton from "./ShoppingCartDestroyButton";
import ShoppingCartLoginButtons from "./ShoppingCartLoginButtons";
import ShoppingCartOrderButton from "./ShoppingCartOrderButton";
import { StripeCheckout } from '@vue-stripe/vue-stripe';

export default {
    name: "Shop",
    props: ['products','guest','routeLogin','routeRegister'],
    components: {
        Products,
        ShoppingCart,
        ShoppingCartDestroyButton,
        ShoppingCartLoginButtons,
        ShoppingCartOrderButton,
        StripeCheckout,
    },
    data() {
        return {
            apiToken: process.env.MIX_STRIPE_KEY,
            successUrl: process.env.MIX_STRIPE_SUCCESS_URL,
            cancelUrl: process.env.MIX_STRIPE_CANCEL_URL,
            stripe: null,
            elements: null,
            card: null,
            loading: false,
        };
    },
    mounted() {
        this.includeStripe('js.stripe.com/v3/', () => {
            this.configureStripe();
        });
    },
    computed: {
        ...mapState({
            hasCart: 'hasCart',
            cartList: 'cartList',
            getCheckout: 'checkout',
        }),
        lineItems() {
            return this.cartList.map(item => {
                return {
                    price: item.price * 100,
                    quantity: item.qty
                };
            });
        }
    },
    methods: {
        ...mapActions({doCheckout: 'doCheckout'}),
        includeStripe( URL, callback ){
            let documentTag = document, tag = 'script',
                object = documentTag.createElement(tag),
                scriptTag = documentTag.getElementsByTagName(tag)[0];
            object.src = '//' + URL;
            if (callback) { object.addEventListener('load', function (e) { callback(null, e); }, false); }
            scriptTag.parentNode.insertBefore(object, scriptTag);
        },
        configureStripe(){
            this.stripe = Stripe(this.apiToken);
            this.elements = this.stripe.elements();
            this.card = this.elements.create('card');
//            this.card.mount('#card-element');
        },
        submit () {
            // You will be redirected to Stripe's secure checkout page
            this.$refs.checkoutRef.redirectToCheckout();
        },
    },
}
</script>

