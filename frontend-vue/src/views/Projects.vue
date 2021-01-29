<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Projects</h1>
    </div>

    <router-link to="/project/add" tag="button" class="button is-primary">Add Project</router-link>

    <div class="content">

      <Timer />

      <table class="table">
        
        <thead>
          <tr>
            <th>#</th>
            <th>Project</th>
            <th>Client</th>
            <th>Status</th>
            <th>Inquiry Date</th>
            <th>Start Date</th>
            <th>Completion Date</th>
          </tr>
        </thead>

        <tbody>
            <tr v-for="project in projects" :key="project.id">
              <td>{{ project.id }}</td>
              <td><a @click="projectDetail(project.id)"><strong>{{ project.projectCode }}</strong> {{ project.projectDescription }}</a></td>
              <td>{{ project.client.firstName }} {{ project.client.lastName }}</td>
              <td>
                <ProjectStatusDropdown :projectId="project.id" :currentStatus="project.status" :statuses="statuses" />
              </td>
              <td>{{ project.inquiryDate }}</td>
              <td>{{ project.startDate }}</td>
              <td>{{ project.completionDate }}</td>
            </tr>
        </tbody>

      </table>
    </div>
  </div>
</template>


<script>
import ProjectStatusDropdown from '@/components/ProjectStatusDropdown.vue'
import Timer from '@/components/timer/Timer.vue'

export default {
    name: 'Projects',
    components: {
        ProjectStatusDropdown,
        Timer
    },
    data: () => ({ 
      projects: [],
      statuses: [] 
    }),
    methods: {
      projectDetail(projectId) {
          this.$router.push('project/' + projectId);
      },
    },
    async beforeMount() {
        const statuses = await this.$http.get('http://localhost:8080/api/statuses');
        console.log('statuses mounted data', statuses);
        this.statuses = statuses.data;
    },
    async mounted() {
        console.log('projects mounted begin');
        const { data } = await this.$http.get('http://localhost:8080/api/projects');
        console.log('projects mounted data', data);
        this.projects = data;
        this.projects.forEach(element => {
            element.visible = false;
        });
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

  .table {
    margin-bottom: 100px;
  }

</style>