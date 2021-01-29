<template>
<div class="timer">
    <timer-main
        :is-modal-open="isModalOpen"
        :hours="hours"
        :minutes="minutes"
        :seconds="seconds"
        @close-modal="toggleModal"
    ></timer-main>
    <timer-footer
        :is-timer-active="isTimerActive"
        @reset="resetUI"
        @toggle-timer="toggleTimer"
        @toggle-modal="toggleModal"
    ></timer-footer>
</div>
</template>

<script>
import TimerMain from '@/components/timer/TimerMain.vue'
import TimerFooter from '@/components/timer/TimerFooter.vue'
export default {
    components: {
        TimerMain,
        TimerFooter
    },
    data: () => ({ 
        // Settings
        initWork: 0,
        initShortBreak: 5,

        // App state
        isBreakTime: false,
        isTimerActive: false,
        hours: '00',
        minutes: '00',
        seconds: '00',
        timer: null,
        round: 0,

        // UI
        isModalOpen: false,
    }),
    methods: {

        toggleModal: function() {
            this.isModalOpen = !this.isModalOpen;
        },

        resetSettings() {
            this.hours = '00';
            this.minutes = '00';
            this.seconds = '00';
        },

        resetUI() {
            this.isBreakTime = false;
            this.isTimerActive = false;
            this.hours = this.initWork;
            this.minutes = '00';
            this.seconds = '00';
            clearInterval(this.timer);
        },

        toggleTimer: function() {
            let self = this;

            function countUp() {
                let seconds = Number(self.$data.seconds);
                let minutes = Number(self.$data.minutes);
                let hours = Number(self.$data.hours);
                
                if (minutes === 60) {
                    self.hours++;
                    self.minutes = 0;
                } else {
                    self.minutes = Number(minutes);
                    minutes <= 10 ? Number(self.minutes = `0${self.minutes}`) : Number(self.minutes = `${self.minutes}`);
                }
                if (seconds === 60) {
                    self.minutes++;
                    self.seconds = 0;
                } else {
                    self.seconds++;
                    seconds <= 10 ? self.seconds = `0${self.seconds}` : self.seconds = `${self.seconds}`;
                }
            
                self.hours = Number(hours);
                hours <= 10 ? Number(self.hours = `0${self.hours}`) : Number(self.hours = `${self.hours}`);

            }
            
            // toggle timer
            self.isTimerActive ? clearInterval(self.timer) : self.timer = setInterval(countUp, 1000);
            self.isTimerActive = !self.isTimerActive;
        },

        handleChange: function(obj) {

            // let data = obj.data;
            let value = obj.value;

            this.initWork = value;
            this.minutes = value;
            this.seconds = '00';
        },
    },
}
</script>

<style lang="scss" scoped>

    .timer {
        background-color: #ddd;
    }

</style>