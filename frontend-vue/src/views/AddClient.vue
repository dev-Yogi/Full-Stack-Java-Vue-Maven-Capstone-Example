<template>
    <div>
        <h1 class="title">Add Client</h1>

        <div class="field"> 
            <label class="label">Client Code</label>
            <div class="control">
                <input class="input" type="text" v-model="client.clientCode" placeholder="Enter Initials of Client" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">First Name</label>
            <div class="control">
                <input class="input" type="text" v-model="client.firstName" placeholder="First Name" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Last Name</label>
            <div class="control">
                <input class="input" type="text" v-model="client.lastName" placeholder="Last Name" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Email Address</label>
            <div class="control">
                <input id="email" class="input" type="email" name="email" v-model="client.emailAddress" placeholder="Email Address" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Phone Number</label>
            <div class="control">
                <input class="input" type="text" v-model="client.phoneNumber"/>
            </div> 
        </div>

        <div class="field">
            <label class="label">Referral Type</label>
            <div class="select">
                <select v-model="client.referral.id" placeholder="Select Referral Type">
                    <option v-for="referral in referrals" :value="referral.id" :key="referral.id">
                        {{ referral.referral }}
                    </option>
                </select>
            </div>
        </div>
   
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
    name: 'AddClient',
    data: () => ({
        client: {
            clientCode: "",
            firstName: "",
            lastName: "",
            emailAddress: "",
            phoneNumber: "",
            referral: {}
        },
        referrals: [],
        errors: []
    }),
    methods: {
        cancel() {
            this.$router.push({path: '/clients'});
        },
        async save() {
            const response = await this.$http.post('http://localhost:8080/api/clients/', this.client)
            console.log(response);
            if (response.status === 200) {
                this.$router.push({path: '/clients'});
            }
        },
        async getReferrals() {
            const { data } = await this.$http.get('http://localhost:8080/api/referrals/');
            console.log('getReferrals() data', data)
            return data;
        },
        checkForm: function (e) {
        this.errors = [];

            if (!this.name) {
                this.errors.push("Name required.");
            }
            if (!this.email) {
                this.errors.push('Email required.');
            } else if (!this.validEmail(this.email)) {
                this.errors.push('Ope. Please enter a valid email.');
            }

            if (!this.errors.length) {
                return true;
            }

            e.preventDefault();
        },
        validEmail: function (email) {
        var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
        }
},
    async mounted() {
        this.referrals = await this.getReferrals();
        }
}
</script>
<style scoped>
button {
    margin-top: 20px;
    margin-bottom: 100px;
}

button.is-primary {
    background-color: black;
    margin-top: 20px;
    margin-bottom: 100px;
}

button.is-primary:hover {
    background-color: #666666;
}

.input, .textarea {
    width: 50%;
}
</style>