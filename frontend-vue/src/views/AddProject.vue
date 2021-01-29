<template>
    <div>

        <h1 class="title">Add Project</h1>

        <div class="field">
            <label class="label">Client</label>

            <autocomplete
                source="http://localhost:8080/api/clients/search/"
                results-property="clients"
                :results-display="clientName"
                v-model="project.client.id"
                class="field"
                inputClass="input">
            </autocomplete>

            <!-- <div class="select">
                <select v-model="project.client.id">
                    <option v-for="client in clients" :value="client.id" :key="client.id">
                        {{ client.firstName }} {{ client.lastName }}
                    </option>
                </select>
            </div> -->

        </div>
        
        <div class="field">
            <label class="label" for="projectCode">Project Code</label>
            <div class="control">
                <input id="projectCode" class="input" type="text" v-model="project.projectCode" placeholder="Project Code" />
            </div>
        </div>

        <div class="field">
            <label class="label" for="projectDescription">Project Description</label>
            <div class="control">
                <input id="projectDescription" class="input" type="text" v-model="project.projectDescription" placeholder="Project Description" />
            </div>
        </div>

        <div class="field">
            <label class="label">Status</label>
            <div class="select">
                <select v-model="project.status.id">
                    <option v-for="status in statuses" :value="status.id" :key="status.id">
                        {{ status.status }}
                    </option>
                </select>
            </div>
        </div>

        <div class="field">
            <label class="label" for="projectNumber">Project Number</label>
            <div class="control">
                <input id="projectNumber" class="input" type="text" v-model="project.clientProjectNumber" placeholder="Project Number" />
            </div>
        </div>

        <div class="field is-grouped">
            <div class="control">
                <button v-on:click="cancel" class="button">Cancel</button>
            </div>
            <div class="control">
                <button v-on:click="save" class="button is-primary">Save</button>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    data: () => ({
        project: {
            client: {},
            projectCode: "",
            projectDescription: "",
            status: {},
            clientProjectNumber: ""
    },
        statuses: [],
        clients: []
    }),
    methods: {
        async save() {
            // save project, that project object (data.project) will be sent
            console.log('AddProject.save() client=', JSON.parse(JSON.stringify(this.project.client)));
            const response = await this.$http.post('http://localhost:8080/api/projects/', this.project);
            console.log(response);
            if (response.status === 200) {
            this.$router.push({path: '/projects'});
            }
        },
        cancel() {
            this.$router.push({path: '/projects'});
        },
        clientName(client) {
            let clientName = '(' + client.clientCode + ') ' + client.firstName + ' ' + client.lastName;
            clientName += client.emailAddress ? ' - ' + client.emailAddress : '';
            return clientName;
        },
        async getStatuses() {
            const { data } = await this.$http.get('http://localhost:8080/api/statuses/');
            console.log('getStatuses() data', data)
            return data;
        },
        async getClients() {
            const { data } = await this.$http.get('http://localhost:8080/api/clients/');
            console.log('getClients() data', data);
            return data;
        }
    },
    async mounted() {
        this.statuses = await this.getStatuses();
        this.clients = await this.getClients();
    }
}
</script>

<style scoped>
    label.radio {
        margin-right: 1rem;
    }

    button{
        margin-top: 10px;
    }

    button.is-primary{
        background-color: black;
        margin-top: 10px;
    }

    button.is-primary:hover{
        background-color: #666666;
    }
    
    .input, .textarea {
    width: 50%;
}
</style>