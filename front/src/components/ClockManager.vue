<script setup>
import {ref} from "vue";

const hr = ref(0);
const min = ref(0);
const sec = ref(0);
const startTimer = ref(null);

function start(){
    startTimer.value = setInterval(()=>{
        sec.value++
        if (sec.value === 60){
            min.value++
            sec.value = 0
        }
        if (min.value === 60){
            hr.value++
            min.value = 0
        }
    },1000)
}

function end(){
    hr.value = min.value = sec.value = 0;
    clearInterval(startTimer.value);
}

</script>

<template>

  <div id="app">
    <p @click="start">Start: {{currentDateTime()}}</p>
  </div>

    <div class="wrapper">
        <div class="time">
            <span class="hour">{{hr < 10 ? "0" + hr: hr}}</span>
            <span class="colone">:</span>
            <span class="minute">{{min < 10 ? "0" + min : min}}</span>
            <span class="colone">:</span>
            <span class="seconde">{{sec < 10 ? "0" + sec : sec}}</span>
        </div>
        <div class="button">
            <button class="start" @click="start">Start</button>
            <button class="end" @click="end">End</button>
        </div>
    </div>

</template>

<script>
export default {
  methods: {
    currentDateTime() {
      const current = new Date();
      const date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
      const time = current.getHours() + ":" + current.getMinutes();
      const dateTime = date +' '+ time;

      return dateTime;
    }
  }
};
</script>

<style>

.wrapper {
    user-select: none;
}

.wrapper .time {
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
}

.wrapper .time span {
    width: 100px;
    text-align: center;
    font-size: 50px;
    font-weight: 500;
}

.time span.colone {
    width: 10px;
}

.wrapper .button {
    text-align: center;
    margin-top: 10px;
}

.button button {
    padding: 6px 16px;
    outline: none;
    border: none;
    margin: 0 5px;
    font-size: 19px;
    font-weight: 500;
    border-radius: 4px;
    cursor: pointer;
}

</style>