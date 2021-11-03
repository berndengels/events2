
const CartRepository = {
    storageKey: 'stateData',
    getQtyTotal(state) {
        let qty = 0
        _.forIn(state.cart, (val) => {
            state.priceTotal += val.priceTotal
            qty += val.qty
        })
        return qty
    },
    setStorageByState(state) {
        localStorage.setItem(this.storageKey, JSON.stringify(state))
    },
    getStateByStorage() {
        let storage = localStorage.getItem(this.storageKey)
        if(storage) {
            let data = JSON.parse(storage)
            return data
        }
        return null
    },
    removeStorage() {
        localStorage.removeItem(this.storageKey)
    }
}
export default CartRepository
