import AppListing from '../app-components/Listing/AppListing';

Vue.component('event-listing', {
    mixins: [AppListing],
    props: ['categories'],
    data() {
        return {
            categorySelect: {},
            fromDateSelect: {},
            untilDateSelect: {},
            showCategoryFilter: true,
            showEventDateFilter: true,
            filters: {
                category: null,
                fromDate: null,
                untilDate: null,
            },
        }
    },
    watch: {
        showCategoryFilter: function (newVal, oldVal) {
            this.categorySelect = [];
        },
        categorySelect: function(newVal, oldVal) {
            this.filters.category = newVal;
            this.filter('category', this.filters.category);
        },
        fromDateSelect: function(newVal, oldVal) {
            this.filters.fromDate = newVal;
        },
        untilDateSelect: function(newVal, oldVal) {
            this.filters.untilDate = newVal;
        },
    },
});
