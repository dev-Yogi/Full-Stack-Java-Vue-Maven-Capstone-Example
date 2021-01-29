<template>
    <div>
        <h1 class="title">Add Transaction</h1>

        <div class="field"> 
            <label class="label">Date</label>
            <div class="control">
                <input class="input" type="date" v-model="revenue.transactionDate" placeholder="Date" />
            </div> 
        </div>

        <div class="field is-narrow">
            <label class="label">Location</label>
            <div class="select">
                <select v-model="revenue.location" placeholder="Select Location">
                    <option v-for="location in locations" :value="location" :key="location.id">
                        {{ location.locationName }} {{ location.addressDesc}}
                    </option>
                </select>
            </div>
        </div>

    <label class="label h2">Add Revenue Line Items</label>
    <div class="field is-horizontal">
        <div class="field-body">
        
        <div class="field"> 
            <label class="label">Description</label>
            
                <input class="input" type="text" v-model="revenue.transactionDesc" placeholder="i.e. Deposit for Chairs, Returned Screws, etc." />
            
        </div>

        <div class="field is-narrow"> 
            <label class="label">Amount</label>
            
                <input class="input" type="text" v-model="revenue.transactionAmount" placeholder="49.00" />
             
        </div>

        <div class="field is-narrow">
            <label class="label">Revenue Type</label>
            <div class="select">
                <select v-model="revenue.revenuetype" placeholder="Select Revenue Type">
                    <option v-for="revenuetype in revenuetypes" :value="revenuetype" :key="revenuetype.id">
                        {{ revenuetype.revenuetype }}
                    </option>
                </select>
            </div>
        </div>

        <div class="field is-narrow">
            <label class="label">Project</label>
            <div class="select">
                <select v-model="revenue.project" placeholder="Select Project">
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

    <table id="add-revenue" class="table">
        <thead>
          <tr>
            <th>Description</th>
            <th>Amount</th>
            <th>Revenue Type</th>
            <th>Project</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="revenue in revenues" :key="revenue.id">
              <td>{{ revenue.transactionDesc }}</td>
              <td>{{ revenue.transactionAmount | toCurrency }}</td>
              <td>{{ revenue.revenuetype.revenuetype }}</td>
              <td>{{ revenue.project ? revenue.project.projectCode : '' }}</td>
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
    name: 'AddRevenue',
    data: () => ({
        revenue: {
            transactionDate: "",
            transactionDesc: "",
            location: {},
            transactionAmount: "",
            revenuetype: {},
            project: {},
        },
        revenuetypes: [],
        projects: [],
        locations: [],
        revenues: []
    }),
    methods: {
        cancel() {
            this.$router.push({path: '/ledger'});
        },
        async add() {
            console.log('Add=', this.revenue);
            this.revenues.push(JSON.parse(JSON.stringify(this.revenue)));
            this.revenue.revenuetype={};
            this.revenue.transactionDesc='';
            this.revenue.transactionAmount='';
            this.revenue.project={};
        },
        async save() {
            console.log('Save=', this.revenue);
            const response = await this.$http.post('http://localhost:8080/api/revenues/', this.revenues);
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
        async getRevenueTypes() {
            const { data } = await this.$http.get('http://localhost:8080/api/revenuetypes/');
            console.log('getRevenueTypes() data', data)
            return data;
        },
        async getLocations() {
            const { data } = await this.$http.get('http://localhost:8080/api/locations/');
            console.log('getLocations() data', data)
            return data;
        },

},
    async mounted() {
        this.revenuetypes = await this.getRevenueTypes();
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

.h2 {
    font-size: larger;
}
</style>