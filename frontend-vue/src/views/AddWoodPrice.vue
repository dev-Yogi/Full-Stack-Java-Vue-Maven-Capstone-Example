<template>
    <div>
        <h1 class="title">Add Wood Price</h1>

        <div class="field"> 
            <label class="label">Wood Thickness</label>
            <div class="control">
                <input class="input" type="text" v-model="woodtype.woodThickness" placeholder="Enter Thickness of Wood (i.e. 3/4)" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Size</label>
            <div class="control">
                <input class="input" type="text" v-model="woodtype.woodSize" placeholder="Enter Wood Size (i.e. 4x8 or 6')" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Wood Type</label>
            <div class="control">
                <input class="input" type="text" v-model="woodtype.woodType" placeholder="White Oak, Maple, Pine, etc." />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Variety</label>
            <div class="control">
                <input class="input" type="text" v-model="woodtype.woodVariety" placeholder="Enter Variety (if applicable)"/>
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Price Per Unit</label>
            <div class="control">
                <input class="input" type="text" v-model="woodprice.pricePerUnit" placeholder="Price per Unit"/>
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Unit Type</label>
            <div class="control">
                <input class="input" type="text" v-model="woodprice.unitType" placeholder="BF, Board, Sheet, etc."/>
            </div> 
        </div>

        <div class="field">
            <label class="label">Location</label>
            <div class="select">
                <select v-model="location.id" placeholder="Select Location">
                    <option v-for="location in locations" :value="location.id" :key="location.id">
                        {{ location.location }}
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
    name: 'Add Wood Type',
    data: () => ({
        woodtype: {
            woodThickness: "",
            woodSize: "",
            woodType: "",
            woodVariety: ""
        },
        woodprices: []
    }),
    methods: {
        cancel() {
            this.$router.push({path: '/woodprices'});
        },
        async save() {
            const response = await this.$http.post('http://localhost:8080/api/woodprices/', this.woodprice)
            console.log(response);
            if (response.status === 200) {
                this.$router.push({path: '/woodprices'});
            }
        },
    
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