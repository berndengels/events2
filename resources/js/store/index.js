import Vue from 'vue'
import Vuex from 'vuex'
import cart from "./modules/cart";
import CartRepository from "../repositories/CartRepository";

Vue.use(Vuex)

const apiRoute = "/carts";

function array_values(assoc) {
    let a = [];
    for(let item in assoc) {
        a.push(assoc[item])
    }
    return a;
}

const store = new Vuex.Store({
    state: {
        porto: 0,
        priceTotal: 0,
        cart: [],
        activeCartItem: null,
        cartList: [],
        hasCart: null,
        checkout: false,
        lineItems: [],
    },
    getters: {},
    actions: {
        add({commit}, product) {
            commit('add', product)
        },
        increment({commit}, item) {
            commit('increment', item)
        },
        decrement({commit}, item) {
            commit('decrement', item)
        },
        delete({commit}, item) {
            commit('delete', item)
        },
        destroy({commit}, item) {
            commit('destroy')
        },
        doCheckout({commit}) {
            commit('setCheckout', true)
        }
    },
    mutations: {
        initStateByStorage: state => {
            let storage = CartRepository.getStateByStorage(state)
            if(storage) {
    //            state = storage
                _.forIn(storage, (val, key) => {
                    state[key] = val
                })
                console.info(state)
            }
        },
        add: (state, product) => {
            if(product.hasSize && "" === product.size) {
                alert('Bitte erst die Größe wählen');
                return;
            }
            let name = "" !== product.size ? product.name +" Size: " + product.size : product.name,
                id = "" !== product.size ? product.id + "-" + product.size : product.id;

            if(state.cart[id]) {
                console.info(id + ": " + state.cart[id].size + ": " + product.size);
                state.cart[id] =  {
                    ...state.cart[id],
                    id: id,
                    name: name,
                    size: product.size,
                }
            } else {
                state.cart[id] =  {
                    id: id,
                    name: name,
                    qty: 0,
                    price: product.price,
                    size: product.size,
                }
            }

            state.priceTotal = 0;
            state.cart[id].qty++
            state.cart[id].priceTotal = state.cart[id].price * state.cart[id].qty
            let qty = CartRepository.getQtyTotal(state);
            state.porto = qty >= 3 ? 5 : 3;
            state.hasCart = !!_.values(state.cart).length;
            state.cartList = _.values(state.cart);
            state.activeCartItem = state.cart[id];
            CartRepository.setStorageByState(state);
        },
        increment: (state, item) => {
            state.cart[item.id].qty++
            state.cart[item.id].priceTotal += parseInt(item.price)
            state.priceTotal += parseInt(item.price)
            let qty = CartRepository.getQtyTotal(state)
            state.porto = qty >= 3 ? 5 : 3;
            state.hasCart = !!_.values(state.cart).length
            state.cartList = _.values(state.cart)
            CartRepository.setStorageByState(state)
        },
        decrement: (state, item) => {
            state.cart[item.id].qty--
            state.cart[item.id].priceTotal -= parseInt(item.price)
            state.priceTotal -= parseInt(item.price)

            if( state.cart[item.id].qty <= 0 ) {
                state.cart[item.id] = null
                _.pullAt(state.cart, [item.id]);
            }
            let qty = CartRepository.getQtyTotal(state)
            state.porto = qty >= 3 ? 5 : 3;
            state.hasCart = !!_.values(state.cart).length
            state.cartList = _.values(state.cart)
            CartRepository.setStorageByState(state)
        },
        delete: (state, item) => {
            _.pullAt(state.cart, [item.id]);
            state.id = null
            let qty = CartRepository.getQtyTotal(state)
            state.porto = qty >= 3 ? 5 : 3;
            state.priceTotal -= parseInt(item.priceTotal)
            state.hasCart = !!_.values(state.cart).length
            state.cartList = _.values(state.cart)
            state.activeCartItem = null
            CartRepository.setStorageByState(state)
        },
        destroy: (state) => {
            state.id = null
            state.cart = []
            state.cartList = []
            state.priceTotal = 0
            state.porto = 0
            state.hasCart = false
            state.activeCartItem = null
            CartRepository.setStorageByState(state)
        },
        setCheckout: (state, enabled) => {
            state.checkout = enabled
            CartRepository.setStorageByState(state)
        },
    },
})
export default store;
