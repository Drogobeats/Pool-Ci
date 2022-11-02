<script setup>
import User from './components/User.vue'
import Line from './components/charts/line.js'
import Doughnut from './components/charts/doughnut.js'
import Bar from './components/charts/bar.js'
import ClockManager from './components/ClockManager.vue'
</script>

<template>
  <h1>Le Time Manager groupe Lille 9</h1><br>
  <nav>
    <User
      :username="username"
      :email="email"
    />
  </nav>
  <ClockManager/><br>
  <div class="container">
    <div class="row justify-content-around">
      <div class="col-4">
        <div class="card border-secondary mb-3" style="max-width: 40rem;">
          <div class="card-header">OverTimes</div>
          <div class="card-body text-secondary">
            <Line/>
          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card border-secondary mb-3" style="max-width: 40rem;">
          <div class="card-header">Je sais plus</div>
          <div class="card-body text-secondary">
            <Doughnut/>
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-content-around">
      <div class="col-4">
        <div class="card border-secondary mb-3" style="max-width: 40rem;">
          <div class="card-header">La non plus</div>
          <div class="card-body text-secondary">
            <Bar/>
          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card border-secondary mb-3" style="max-width: 40rem;">
          <div class="card-header">La non plus</div>
          <div class="card-body text-secondary">
            <Bar/>
          </div>
        </div>
      </div>
    </div> 
  </div>
</template>

<script>
export default {
  name:'Time Manager',
  components:{
    User,
  },
  data(){
    return{
      username:"marvin",
      email:"marvin@epitech.eu",
      newname:"",
      newemail:"",
    }
  },
  methods :{
    async createUser(){
      console.log(this.newname)
    }
  }
};
</script>


<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
