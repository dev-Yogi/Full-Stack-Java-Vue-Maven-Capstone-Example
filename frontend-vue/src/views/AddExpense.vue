<template>
    <div>
        <h1 class="title">Add Transaction</h1>


        <div class="field is-narrow"> 
            <label class="label">Transaction ID</label>
            <div class="control">
                <input class="input" type="text" v-model="expense.transactionId" placeholder="ID" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Date</label>
            <div class="control">
                <input class="input" type="date" v-model="expense.transactionDate" placeholder="Date" />
            </div> 
        </div>

        <div class="field is-narrow">
            <label class="label">Location</label>
            <div class="select">
                <select v-model="expense.location" placeholder="Select Location">
                    <option v-for="location in locations" :value="location" :key="location.id">
                        {{ location.locationName }} {{ location.addressDesc}}
                    </option>
                </select>
            </div>
        </div>

    <label class="label">Add Expense Items</label>
    <div class="field is-horizontal">
        <div class="field-body">
        
        <div class="field"> 
            <label class="label">Description</label>
            
                <input class="input" type="text" v-model="expense.transactionDesc" placeholder="i.e. Wood, Tool, Screws, etc." />
            
        </div>

        <div class="field is-narrow"> 
            <label class="label">Amount</label>
            
                <input class="input" type="text" v-model="expense.transactionAmount" placeholder="49.00" />
             
        </div>

        <div class="field is-narrow"> 
            <label class="label">Quantity</label>
            
                <input class="input" type="text" v-model="expense.itemQuantity" placeholder="2" />

        </div>

        <div class="field is-narrow">
            <label class="label">Expense Type</label>
            <div class="select">
                <select v-model="expense.expensetype" placeholder="Select Expense Type">
                    <option v-for="expensetype in expensetypes" :value="expensetype" :key="expensetype.id">
                        {{ expensetype.expensetype }}
                    </option>
                </select>
            </div>
        </div>

        <div class="field is-narrow">
            <label class="label">Project</label>
            <div class="select">
                <select v-model="expense.project" placeholder="Select Project">
                    <option v-for="project in projects" :value="project" :key="project.id">
                        {{ project.projectCode }} {{ project.projectDescription }}
                    </option>
                </select>
            </div>

            
        </div>
        <div class="field is-grouped">
            <p class="control">
                <button v-on:click="add" class="button is-primary">Add</button>
            </p>
            </div>
        </div>
    </div>

    <table id="add-expense" class="table">
        <thead>
          <tr>
            <th>Description</th>
            <th>Amount</th>
            <th>Quantity</th>
            <th>Expense Type</th>
            <th>Project</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="expense in expenses" :key="expense.id">
              <td>{{ expense.transactionDesc }}</td>
              <td>{{ expense.transactionAmount | toCurrency }}</td>
              <td>{{ expense.itemQuantity }}</td>
              <td>{{ expense.expensetype.expensetype }}</td>
              <td>{{ expense.project ? expense.project.projectCode : '' }}</td>
            </tr>
        </tbody>
      </table>

        <div class="field is-grouped">
            <p class="control">
                <button v-on:click="cancel" class="button">Cancel</button>
            </p> 
            <p class="control">
                <button v-on:click="save" class="button is-primary">Save</button>
            </p>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AddExpense',
    data: () => ({
        expense: {
            transactionId: "",
            transactionDate: "",
            transactionDesc: "",
            location: {},
            transactionAmount: "",
            expensetype: {},
            project: {},
            itemQuantity: ""
        },
        expensetypes: [],
        projects: [],
        locations: [],
        expenses: []
    }),
    methods: {
        cancel() {
            this.$router.push({path: '/ledger'});
        },
        async add() {
            console.log('Add=', this.expense);
            this.expenses.push(JSON.parse(JSON.stringify(this.expense)));
            this.expense.itemQuantity='';
            this.expense.expensetype={};
            this.expense.transactionDesc='';
            this.expense.transactionAmount='';
            this.expense.project={};
        },
        async save() {
            console.log('Save=', this.expense);
            const response = await this.$http.post('http://localhost:8080/api/expenses/', this.expenses);
            console.log(response);
            if (response.status === 200) {
                this.$router.push({path: '/ledger'});
            }
        },
        async getProjects() {
            const { data } = await this.$http.get('http://localhost:8080/api/projects/');
            console.log('getProjects() data', data)
            return data;
        },
        async getExpenseTypes() {
            const { data } = await this.$http.get('http://localhost:8080/api/expensetypes/');
            console.log('getExpenseTypes() data', data)
            return data;
        },
        async getLocations() {
            const { data } = await this.$http.get('http://localhost:8080/api/locations/');
            console.log('getLocations() data', data)
            return data;
        },

},
    async mounted() {
        this.expensetypes = await this.getExpenseTypes();
        this.projects = await this.getProjects();
        this.locations = await this.getLocations();
    }
}
</script>
<style scoped>
button {
    margin-top: 32px;
}

button.is-primary {
    background-color: black;
    margin-top: 32px;
}

button.is-primary:hover {
    background-color: #666666;
}

.table {
    width: 100%;
    text-align: left;
}
</style>