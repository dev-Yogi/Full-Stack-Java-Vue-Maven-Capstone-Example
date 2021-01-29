<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Revenues</h1>
    </div>

    <router-link to="/revenue" tag="button" class="button is-primary">Add Revenue</router-link>

    <div class="content">

      <table id="expenses" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>Description</th>
            <th>Location</th>
            <th>Revenue Type</th>
            <th>Project Code</th>
            <th class="amount-head">Amount</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="revenue in revenues" :key="revenue.id">
              <td>{{ revenue.id }}</td>
              <td>{{ revenue.transactionDate }}</td>
              <td>{{ revenue.transactionDesc }}</td>
              <td>{{ revenue.locationName }} {{ revenue.addressDesc }}</td>
              <td>{{ revenue.revenuetype.revenuetype }}</td>
              <td>{{ revenue.project ? revenue.project.projectCode : '' }}</td>
              <td class="amount">{{ revenue.transactionAmount | toCurrency }}</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Revenues',
    data: () => ({ 
      revenues: [] 
    }),
    methods: {
      revenueDetail(revenueId) {
          this.$router.push('revenues/' + revenueId);
      }
    },
        async mounted() {
            console.log('revenues mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/revenues');
            console.log('revenues mounted data', data);
            this.revenues = data;
        }
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