<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Business Ledger</h1>
    </div>

    <router-link to="/expense" tag="button" class="button is-primary">Add Expense</router-link>
    <router-link to="/revenue" tag="button" class="button is-primary revenue">Add Revenue</router-link>

    <div class="content">
      <table id="transactions" class="table">
        <thead>
          <tr>
            <th>Date</th>
            <th>Description</th>
            <th></th>
            <th></th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="transaction in transactions">
            <tr :key="transaction.id">
              <td>{{ transaction.transactionDate }}</td>
              <td>{{ transaction.location.locationName }}</td>
              <td></td>
              <td></td>
              <td class="amount" style="color: #ca4040;">-{{ transaction.total | toCurrency }}</td>
            </tr>

            <tr :key="transaction.id">
              <table id="expenses" class="table">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Revenue Type</th>
                    <th>Expense Type</th>
                    <th>Amount</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="expense in transaction.expenses" :key="expense.id">
                    <td>{{ expense.transactionDate }}</td>
                    <td>
                      {{ expense.transactionDesc }}
                      <strong>-</strong>
                      {{ expense.location.locationName }}
                    </td>
                    <td></td>
                    <td>{{ expense.expensetype.expensetype }}</td>
                    <td
                      class="amount"
                      style="color: #ca4040;"
                    >-{{ expense.transactionAmount | toCurrency }}</td>
                  </tr>
                </tbody>
              </table>
            </tr>
          </template>
          
          <tr v-for="revenue in revenues" :key="revenue.id">
            <td>{{ revenue.transactionDate }}</td>
            <td>{{ revenue.transactionDesc }}</td>
            <td>{{ revenue.revenuetype.revenuetype }}</td>
            <td></td>
            <td class="amount" style="color: #3273dc;">+{{ revenue.transactionAmount | toCurrency }}</td>
          </tr>
        </tbody>
      </table>

      <!-- <tr class="table-total-row">
            <td></td>
            <td></td>
            <td></td>
            <td class="table-total">Total:</td>
            <td></td>
      </tr>-->
    </div>
  </div>
</template>


<script>
export default {
  data: () => ({
    expenses: [],
    revenues: [],
    transactions: [],
  }),
  methods: {
    expenseDetail(expenseId) {
      this.$router.push("expenses/" + expenseId);
    },
  },
  async mounted() {
    console.log("expenses mounted begin");
    const { data } = await this.$http.get("http://localhost:8080/api/expenses");
    console.log("expenses mounted data", data);
    this.expenses = data;
    this.expenses.forEach((expense) => {
      if (expense.transactionId) {
        let transaction = this.transactions.find(
          (transaction) => transaction.id === expense.transactionId
        );
        if (!transaction) {
          transaction = {};
          transaction.id = expense.transactionId;
          transaction.transactionDate = expense.transactionDate;
          transaction.location = expense.location;
          transaction.expenses = [];
        }

        transaction.total = transaction.total
          ? (transaction.total += expense.transactionAmount)
          : expense.transactionAmount;
        transaction.expenses.push(expense);
        this.transactions.push(transaction);
      }
    });

    console.log("Transactions = ", this.transactions);

    const revenues = await this.$http.get(
      "http://localhost:8080/api/revenues/"
    );
    this.revenues = revenues.data;
    console.log("revenues mounted data", revenues);
  },
};
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

.button.is-primary.revenue {
  margin-right: 1vw;
}

.button.is-primary:hover {
  background-color: #666666;
}

.table-total-row {
  background-color: rgba(50, 115, 220, 0.5);
}

.table-total {
  color: #3273dc;
  text-align: right;
  font-weight: 600;
}

table {
  border-top-color: #3273dc;
  width: 100%;
}
</style>