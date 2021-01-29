<template>
<div id="main">
    <div class="container">
        <h1 class="text-center">Settings</h1>
        <ul class="nav justify-content-center flex-column flex-md-row text-center">
            <li class="nav-item"><router-link to="/settings">Profile</router-link></li>
            <li class="nav-item"><router-link to="/rates">Rates</router-link></li>
            <li class="nav-item"><router-link to="/markup">Markup</router-link></li>
            <li class="nav-item"><router-link to="/display">Display</router-link></li>
        </ul>
    </div>
    <div class="header-container">
    <header class="header">
        <div class="profile-left">
            <div class="profile-img-top">
                <div class="profile-img-frame">
                    <button class="profile-img-btn" title="Change Profile Photo">
                        <img alt="Change Profile Photo" class="profile-img" src="../assets/Cleveland-Custom-Carpentry-Logo-Reverse-02.png">
                    </button>
                    <div></div>
                </div>
            </div>
        </div>
        <section class="profile-info">
            <div class="profile-name-edit">
            <h2 class="username">Cleveland Custom Carpentry</h2>
            <div class="edit-profile"> <a class="edit-profile-link" href="/settings/editprofile">Edit Profile</a></div>
            </div>
            <ul class="stats">
                <li class="projects-stat">
                    <router-link class="navbar-item" to="/projects">
                        <span class="projects-num"> </span>
                         projects
                    </router-link>
                </li>
                <li class="clients-stat">
                    <router-link class="navbar-item" to="/clients">
                        <span class="clients-num"> </span>
                         clients
                    </router-link> 
                </li>
            </ul>
            <div class="bio">
                <h2 class="bio-name">Danny Cleveland</h2>
                <span>
                    17840 Edna Street Omaha, NE 68136
                    <br>
                </span>
            </div>
        </section>
    </header>
    </div>
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

header > div, header, section {
    display: flex;
    align-items: stretch;
    border: 0 solid #000;
    box-sizing: border-box;
    flex-direction: column;
    position: relative;
    box-orient: vertical;
    box-direction: normal;
    margin: 0;
    padding: 0;
}

.header-container {
    max-width: 935px;
    margin: 40px auto 30px;
    margin-bottom: 0;
}

header {
    flex-direction: row;
}

.profile-left {
    flex-shrink: 0;
}

.profile-img-top {
    display: block;
    margin-left: 50px;
    margin-right: 50px;
    align-items: stretch;
}

.profile-img-frame {
    background-color: black;
    border-radius: 50%;
    box-sizing: border-box;
    height: 100%;
    margin: 0 auto;
    overflow: hidden;
    position: relative;
    width: 100%;
}

button {
    border: 0;
    cursor: pointer;
    height: 100%;
    padding: 0;
    width: 100%;
    font-size: 14px;
    line-height: 18px;
    align-items: flex-start;
    text-align: center;
    background-color: black;
}

.profile-img {
    height: 65%;
    left: 25px;
    position: absolute;
    top: 24px;
    width: 65%;
}

.profile-name-edit {
    flex-direction: row;
    flex-shrink: 1;
    min-width: 0;
}

.edit-profile {
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    font-weight: 600;
    padding: 5px 9px;
    text-align: center;
    text-transform: inherit;
    text-overflow: ellipsis;
}

.username {
    font-weight: 300;
    font-size: 24px;
    line-height: 32px;
    margin: -5px 0 -6px;
}

.stats {
    margin-bottom: 20px;
    display: flex;
    -webkit-box-orient: horizontal;
    flex-direction: row;
}

ul {
    list-style: none;
}

.projects-stat {
    font-size: 16px;
    margin-right: 40px;
}

.bio-name {
    font-weight: 500;
    margin-bottom: none;
}

@media (min-width: 736px) {
    .profile-left {
        margin-right: 30px;
    }
    .profile-img-top {
        height: 150px;
        width: 150px;
    }
}

</style>