<template>
    <ul id="navigation">
        <li v-for="item in navList" :key="item.name">
            <template v-if="item.children">
                <a 
                  :href="item.url" 
                  :title="currentStatus.id" 
                  @click="isOpen = !isOpen, active = !active"
                  :class="{ active }">{{ item.name }} <svg viewBox="0 0 451.847 451.847" width="12"><path d="M225.923,354.706c-8.098,0-16.195-3.092-22.369-9.263L9.27,151.157c-12.359-12.359-12.359-32.397,0-44.751
		c12.354-12.354,32.388-12.354,44.748,0l171.905,171.915l171.906-171.909c12.359-12.354,32.391-12.354,44.744,0
		c12.365,12.354,12.365,32.392,0,44.751L248.292,345.449C242.115,351.621,234.018,354.706,225.923,354.706z" fill="#fff"/></svg></a>
                <div :class="{ isOpen }" class="dropdown">
                    <ul>
                        <li v-for="{ id, status } in item.children" :key="id">
                            <a @click.stop.prevent="updateStatus(id)">{{ status }}</a>
                        </li>
                    </ul>
                </div>
            </template>
            <template v-else>
                <a 
                  :href="item.url" 
                  :title="item.name">{{ item.name }}</a>
            </template>
        </li>
    </ul>
</template>

<script>

// set the current status as text
// after selecting status, hide menu
// after selecting status, update status on page

// -- done create save method to save the status

export default {
  props: {
      statuses: Array,
      projectId: Number,
      currentStatus: {}
  },
  data: () => ({
      isOpen: false,
      active: false,
      navList: [
        {
          url: "#",
          name: "Services",
          children: []
        },
      ]
    }),
    methods: {
      async updateStatus(statusId){
            console.log("statusId = ", statusId);
            let status = {}; 
            status.id = statusId;
            const { data } = await this.$http.patch('http://localhost:8080/api/projects/' + this.projectId, status);
            console.log(data);
            this.navList[0].name = data.status.status;
            this.isOpen = false;
            this.active = false;
      },
    },
    async mounted() {
        console.log('ProjectStatusDropdown: statuses', JSON.parse(JSON.stringify(this.statuses)));
        console.log('ProjectStatusDropdown: projectId', this.projectId);
        console.log('ProjectStatusDropdown: currentStatus', this.currentStatus);
        this.navList[0].children = this.statuses;
        this.navList[0].name = this.currentStatus.status;
    }

}

</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css?family=Raleway&display=swap");

$black: #212529;
$white: #ffffff;

$col1: #9f1414;
$col2: #dc3545;

*,
::before,
::after {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

@mixin flex($fd: row, $jc: flex-start, $ai: flex-start) {
  display: flex;
  flex-direction: $fd;
  justify-content: $jc;
  align-items: $ai;
}

ul {
  list-style-type: none;
  margin: 0;

  li {
    position: relative;
    margin: 0.25em;
    list-style: none;

    a {
      display: block;
      padding: 0.55em 1em;
      text-decoration: none;
      color: darken($white, 15%);
      border-radius: 0.35em;
      background-color: $black;
      transition: all 100ms ease;

      &:hover {
        color: $white;
        background-color: $black;
      }

      &.active {
        background-color: $black;
      }
    }

  }

  &#navigation {
    @include flex($ai: flex-start);
  }
}

.dropdown {
  position: absolute;
  /* left: 50%; */
  transform: translatex(-50%) rotatex(90deg) scale(0);
  margin-top: 0.55em;
  transform-origin: 0 0;
  border-radius: 0.35em;
  background-color: $black;
  visibility: hidden;
  opacity: 0;
  z-index: 1;
  transition: all 100ms linear;

  &.isOpen {
    transform: translatex(-50%);
    visibility: visible;
    opacity: 1;
  }
}

</style>
