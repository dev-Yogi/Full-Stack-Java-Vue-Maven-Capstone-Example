<template>
    <div id="main" v-if="project">
    <div class="header">
        <div class="flex-start"><h1 class="title">{{ project.projectCode }}</h1> <h2 class="subtitle is-size-4 has-text-weight-medium">{{ project.projectDescription }}</h2>
        
        <div class="status-bar">

            <ProjectStatusDropdown :projectId="project.id" :currentStatus="project.status" :statuses="statuses" />

            <a @click.stop.prevent="selectStatus()">{{ project.status.status }}</a>
            <select @change="setStatus(project.id, $event)" v-model="project.status.id" placeholder="Select Status Type">
                <option v-for="status in statuses" :value="status.id" :key="status.id">
                    {{ status.status }}
                </option>
            </select>
        </div>
        </div>
        
        <div id="client-detail">
        <ul>
            <li>{{ project.client.firstName }} {{ project.client.lastName }}</li>
            <li>{{ project.client.emailAddress }} </li>
            <li>{{ project.client.phoneNumber }}</li>
            <li>Project Number: {{ project.clientProjectNumber }}</li>
            <li>Referral Type: {{ project.client.referral.referral }}</li>
        </ul>
        </div>

        <div id="doc-buttons" class="project-element">
            <router-link to="/estimate/add" tag="button" class="button is-primary">Create Estimate</router-link>  
            <router-link to="/invoice/add" tag="button" class="button is-primary">Create Invoice</router-link>   
        </div>

        <div id="cam" class="project-element">
            <router-link to=""><font-awesome-icon :icon="['fas', 'camera']"/></router-link>
        </div> 

    </div>
        <article>
        <div id="col-1 row-1">
            <div id="time-logged" class="project-element">
                <h2 class="subtitle is-size-4 has-text-weight-medium">Time Logged</h2>
                <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-info" value="40" max="100">40%</progress> </div>
                <!-- <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-warning" value="70" max="100">70%</progress></div>
                <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-danger" value="90" max="100">90%</progress></div> -->
            </div>
        </div>
            <div id="expenses-revenues" class="project-element">
                <h2 class="subtitle is-size-4 has-text-weight-medium">Transactions</h2>
                <div class="table-container">
                    <table id="expenses" class="table is-fullwidth is-striped">
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
                            <tr v-for="expense in expenses" :key="expense.id">
                                <td>{{ expense.transactionDate }}</td>
                                <td>{{ expense.transactionDesc }} <strong>-</strong> {{ expense.location.locationName }}</td>
                                <td></td>
                                <td>{{ expense.expensetype.expensetype }}</td>
                                <td class="amount" style="color: #ca4040;">-{{ expense.transactionAmount | toCurrency }}</td>
                            </tr>
                            <tr v-for="revenue in revenues" :key="revenue.id">
                                <td>{{ revenue.transactionDate }}</td>
                                <td>{{ revenue.transactionDesc }}</td>
                                <td>{{ revenue.revenuetype.revenuetype }}</td>
                                <td></td>
                                <td class="amount">+{{ revenue.transactionAmount | toCurrency }}</td>
                            </tr>
                            <tr class="table-total-row">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="table-total">Total: </td>
                                <td> </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="project-images-1">
            <img src="../assets/example-photo-1.jpg" alt="kitty"/>
            </div>

            <div id="project-images-2">
            <img src="../assets/example-photo-2.jpg" alt=""/>
            </div>

            <div id="project-images-3">
            <img src="../assets/example-photo-3.jpg" alt=""/>
            </div>

            <div id="project-images-4">
            <img src="../assets/example-photo-4.jpg" alt=""/>
            </div>

            <div id="project-images-5">
            <img src="../assets/example-photo-5.jpg" alt=""/>
            </div>

        </article>
    </div>
</template>

<script>
import ProjectStatusDropdown from '@/components/ProjectStatusDropdown.vue'

export default {
    components: {
        ProjectStatusDropdown
    },
    data: () => ({
        project: null,
        statuses: [],
        expenses: [],
        revenues: []
    }),
    methods: {
        setStatus: function(projectId, event) {
        console.log(event.target.value);
        console.log(projectId);
        this.updateStatus(projectId, event.target.value);
      },
      selectStatus(){
        alert('Hello');
      },
      async updateStatus(projectId, statusId){
            console.log("statusId = ", statusId);
            let status = {}; 
            status.id = statusId;
            const response = await this.$http.patch('http://localhost:8080/api/projects/' + projectId, status);
            console.log(response);
      }
    },
    async beforeMount() {
        const statuses = await this.$http.get('http://localhost:8080/api/statuses');
        console.log('statuses mounted data', statuses);
        this.statuses = statuses.data;
    },
    async mounted() {
        const { data } = await this.$http.get('http://localhost:8080/api/projects/' + this.$route.params.id);
        this.project = data;
        
        const expenses = await this.$http.get('http://localhost:8080/api/expenses/project/' + this.project.id);
        this.expenses = expenses.data;
        console.log('expenses mounted data', expenses);
        
        const revenues = await this.$http.get('http://localhost:8080/api/revenues/project/' + this.project.id);
        this.revenues = revenues.data;
        console.log('revenues mounted data', revenues);
    }
}
</script>

<style scoped>
.header {
    display: flex;
    margin-bottom: 8vh;
    align-items: flex-end;
}

.flex-start {
    margin-right: 5vw;
    width: 300px;
}

#client-detail {
    margin-right: 5vw;
}

#doc-buttons {
    margin-left: auto;
}

div > .status-bar {
    align-self: flex-end;
    margin-bottom: 0;
}

.header > h1 {
    margin-right: 1vw;
}

article {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    /* grid-template-rows: 1fr 1fr 1fr 1fr 1fr; */
    grid-gap: 4ch;
    padding-bottom: 13vh;
}

#col-1, #row-1 {
    grid-column: 1 / span 1;
    grid-row: 1 / span 1;
}

#doc-buttons > .button:first-child {
    margin-right: 1vw;
}

#time-logged {
    grid-column: 1 / span 1;
}

#project-images-1 {
    grid-column: 3 / span 1;
    grid-row: 1 / span 1;
}

#project-images-2 {
    grid-column: 3 / span 1;
    grid-row: 2 / span 1;
}

#project-images-3 {
    grid-column: 3 / span 1;
    grid-row: 3 / span 1;
}

#project-images-4 {
    grid-column: 3 / span 1;
    grid-row: 4 / span 1;
}

#project-images-5 {
    grid-column: 3 / span 1;
    grid-row: 5 / span 1;
}

.amount {
    text-align: right;
    color: #3273dc;
}

.table-total-row {
    background-color:rgba(50, 115, 220, 0.5);
}

.table-total {
    color: #3273dc;
    text-align: right;
    font-weight: 600;
}
table {
border-top-color: #3273dc;
}   

/* tr:nth-child(even) {background: rgba(50, 115, 220, 0.3);} */

.button.is-primary {
    background-color: black;
  }

.button.is-primary:hover {
    background-color: #666666;
}

.progress-bar {
    margin-bottom: 2ch;
}

.progress-bar > h3 {
    float: right;
}

.progress {
    color: white;
}

#expenses-revenues {
    grid-column: 1 / span 2;
    grid-row: 2 / span 3;
    width: 100%;
    align-items: left;
}

.table th:not([align]) {
    text-align: left;
}

#project-images-1 {
    grid-column: 3 / span 1;
    grid-row: 1 / span 1;
}

#project-images-1 > img {
    object-fit: cover;
    position: relative;
    margin-top: 0;
}

#cam {
    color: #666666;
}

/* #iphone11-main {
    grid-column: 2 / span 1;
    grid-row: 1 / span 3;
    overflow: scroll;
    text-align: left;
    padding: 5em;
} */
</style>