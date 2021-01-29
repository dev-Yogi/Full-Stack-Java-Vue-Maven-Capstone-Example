<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Projects Gallery</h1>
    </div>

    <router-link to="/project/add" tag="button" class="button is-primary">Add Project</router-link>

    <!-- Flexbox for Gallery -->
    <ul class="gallery" v-for="project in projects" :key="project.id">
      
      <!-- Flex Items (repeat through list) -->
      <li class="gal-list-item">
        <a href="" class="list-link">
          <figure class="list-link__image objFit">
              <img src="" sizes="100vh">
          </figure>
          <div class="list-link__wrapper">
              <span class="list-link__project">{{ project.projectCode }} {{ project.projectDescription }}</span>
              
              <span class="list-link__client"><a @click="clientDetail(client.id)">{{ client.firstName }} {{ client.lastName }}</a></span>

              <span class="list-link__status">
                <a @click.stop.prevent="selectStatus()">{{ project.status.status }}</a>
                <select @change="setStatus(project.id, $event)" v-model="project.status.id" placeholder="Select Status Type">
                    <option v-for="status in statuses" :value="status.id" :key="status.id">
                        {{ status.status }}
                    </option>
                </select>
              </span>

          </div>
        </a>
      </li>
    </ul>
  </div>
</template>


<script>
export default {
    name: 'Projects',
    data: () => ({ 
      projects: [],
      statuses: [] 
    }),
    methods: {
      projectDetail(projectId) {
          this.$router.push('project/' + projectId);
      },
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
        async mounted() {
            console.log('projects mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/projects');
            console.log('projects mounted data', data);
            this.projects = data.filter(project => project.status.id >= 3);
            const statuses = await this.$http.get('http://localhost:8080/api/statuses');
            console.log('statuses mounted data', statuses);
            this.statuses = statuses.data;
        },
        
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

  .gallery {
    display: flex;
    height: 100%;
    width: 20%;
    margin: 0;
  }

  li {
    border: 0;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
  }

  .list-link__wrapper {
    display: flex;
    width: 100%;
    justify-content: left;
  }

  .list-link__project {
    display: block;
    color: white;
    font-weight: bolder;
  }

  .list-link__client {
      display: block;
      color: #444;
      font-weight: lighter;
    }

  a.list-link__project {
    text-decoration: none;
  }

  a.list-link__client {
    text-decoration: none;
  }
  
</style>