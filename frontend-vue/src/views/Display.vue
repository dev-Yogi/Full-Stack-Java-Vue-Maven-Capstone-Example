<template>
    <div class="container">
        <h1 class="text-center">Settings</h1>
        <ul class="nav justify-content-center flex-column flex-md-row text-center">
            <li class="nav-item"><router-link to="/profile">Profile</router-link></li>
            <li class="nav-item"><router-link to="/rates">Rates</router-link></li>
            <li class="nav-item"><router-link to="/markup">Markup</router-link></li>
            <li class="nav-item"><router-link to="/display">Display</router-link></li>
        </ul>
    </div>
</template>

<style scoped>
.text-center {
    text-align: center;
}

h1 {
    font-size: 3em;
    letter-spacing: .10em;
    margin-bottom: 15px;
}

.nav {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    width: 30%;
    margin-right: 35%;
    margin-left: 35%;
}

</style>