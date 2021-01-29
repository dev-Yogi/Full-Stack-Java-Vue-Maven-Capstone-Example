<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Wood Prices</h1>
    </div>

    <router-link to="/woodprice" tag="button" class="button is-primary">Add Wood Price</router-link>

    <div class="content">

      <table id="woodprices" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Wood</th>
            <th>Price Per Unit</th>
            <th>Unit Type</th>
            <th>Location</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="woodprice in woodprices" :key="woodprice.id">
              <td>{{ woodprice.id }}</td>
              <td>{{ woodprice.woodtype.woodThickness }} {{ woodprice.woodtype.woodSize }} {{ woodprice.woodtype.woodspecies.woodType }} {{ woodprice.woodtype.woodVariety }}</td>
              <td>{{ woodprice.pricePerUnit | toCurrency }}</td>
              <td>{{ woodprice.unitType }}</td>
              <td>{{ woodprice.location.locationName }}</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Wood Prices',
    data: () => ({ 
      woodprices: [] 
    }),
        async mounted() {
            console.log('revenues mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/woodprices');
            console.log('revenues mounted data', data);
            this.woodprices = data;
        },
    methods: {
      woodPriceDetail(woodprice) {
          this.$router.push('woodprice/' + woodprice);
      }
    },
}
</script>

<style scoped>
  button {
    float: right;
  }

  .content table th:not([align]) {
    text-align: left;
  }

  .button.is-primary {
    background-color: black;
    margin-bottom: 50px;
  }

  .button.is-primary:hover {
    background-color: #666666;
  }

  .amount {
    text-align: right;
    color: #3273dc;
}

.table {
    margin-bottom: 100px;
  }
</style>