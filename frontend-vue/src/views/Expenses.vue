<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Expenses</h1>
    </div>

    <router-link to="/expense" tag="button" class="button is-primary">Add Expense</router-link>

    <div class="content">

      <table id="expenses" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>Description</th>
            <th>Location</th>
            <th>Expense Type</th>
            <th>Project Code</th>
            <th>Quantity</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="expense in expenses" :key="expense.id">
              <td>{{ expense.id }}</td>
              <td>{{ expense.transactionDate }}</td>
              <td>{{ expense.transactionDesc }}</td>
              <td>{{ expense.location.locationName }} {{ expense.location.addressDesc }}</td>
              <td>{{ expense.expensetype.expensetype }}</td>
              <td>{{ expense.project ? expense.project.projectCode : '' }}</td>
              <td>{{ expense.itemQuantity }}</td>
              <td>{{ expense.transactionAmount | toCurrency }}</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Expenses',
    data: () => ({ 
      expenses: [] 
    }),
    methods: {
      expenseDetail(expenseId) {
          this.$router.push('expenses/' + expenseId);
      }
    },
        async mounted() {
            console.log('expenses mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/expenses');
            console.log('expenses mounted data', data);
            this.expenses = data;
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

  .table {
    margin-bottom: 100px;
  }
</style>