/* eslint-disable */
import CartRepository from "../../repositories/CartRepository";

const apiRoute = "/carts";

function array_values(assoc) {
    let a = [];
    for(let item in assoc) {
        a.push(assoc[item])
    }
    return a;
}

const state = {
    id: null,
    porto: 0,
    priceTotal: 0,
    cart: [],
    activeCartItem: null,
    cartList: [],
    hasCart: null,
    size: null,
    checkout: false,
}
const getters = {}
const actions = {
    setSize({commit}, event) {
        commit('setSize', event);
    },
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
}

const mutations = {
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
        let name = state.size ? product.name +" Size: " + state.size : product.name;

        state.id = state.size ? product.id +"-" + state.size : product.id
        if(state.cart[state.id]) {
            alert('has Cart');
            state.cart[state.id] =  {
                ...state.cart[state.id],
                id: state.id,
                name: name,
                qty: 0,
                price: product.price,
            }
        } else {
            alert('has no Cart');
            state.cart[state.id] =  {
                id: state.id,
                name: name,
                qty: 0,
                price: product.price,
            }
        }

        state.cart[state.id].qty++
        state.cart[state.id].priceTotal = state.cart[state.id].price * state.cart[state.id].qty
        state.priceTotal = 0
        let qty = CartRepository.getQtyTotal(state)
        state.porto = qty >= 3 ? 5 : 3;
        state.hasCart = !!_.values(state.cart).length
        state.cartList = _.values(state.cart)
        state.activeCartItem = state.cart[state.id]
        CartRepository.setStorageByState(state)
    },
    setSize: (state, e) => {
        state.size = e.target.value
        let product = e.target.dataset.item;
        state.id = product.id + "-" + state.size;
        if ( state.cart[state.id] ) {
            state.cart[state.id] =  {
                ...state.cart[state.id],
                size: state.size,
            }
        } else {
            let name = product.name + " Size: " + state.size;
            state.cart[state.id] = {
                id: state.id,
                name: name,
                size: state.size,
                qty: 0,
                price: product.price,
                priceTotal: 0,
            }
        }
        state.activeCartItem = state.cart[state.id]
        CartRepository.setStorageByState(state)
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
}

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}
