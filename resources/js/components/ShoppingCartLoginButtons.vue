<template>
    <div>
        <h5>Um die Artikel zu bestellen, mußt Du Dich einloggen oder Registrieren</h5>
        <div class="row justify-content-center">
            <a role="button" class="btn btn-primary btnPay align-middle"
               :href="routeLogin" ><i class="fas fa-user-alt mr-1"></i>
                Login
            </a>
            &nbsp;
            <a role="button"class="btn btn-primary ml-2 btnPay align-middle"
               :href="routeRegister"><i class="fas fa-cash-register mr-1"></i>
                Register
            </a>
        </div>
    </div>
</template>

<script>
export default {
    name: "ShoppingCartLoginButtons",
    props: ['routeLogin','routeRegister'],
}
</script>
