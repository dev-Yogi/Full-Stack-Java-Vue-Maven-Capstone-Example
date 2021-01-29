<template>
  <main class="site__content">
    <div class="container">
      <div class="timer">
        <span class="timer__session js-session">Timer</span>
        <span class="timer__countdown js-countdown">{{`${hours}:${minutes}:${seconds}`}}</span>
      </div>
    </div>

  </main>
</template>
<script>
export default {
   props: [
    'isModalOpen',
    'isBreakTime',
    'hours',
    'minutes',
    'seconds',
  ],
  methods: {
    closeModal: function() {
      this.$emit('close-modal');
    }
  },
  components: {

  },
}
</script>

<style lang="scss" scoped>
    $primary: #d9534f;
    $secondary: #3eab45;
    $white: #fff;
    $text: #333;

    @import url('https://fonts.googleapis.com/css?family=Pacifico');

    *,
    *::after,
    *::before {
    box-sizing: border-box;
    }


    // Layout
    .site {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    background-color: $primary;
    transition: background-color .15s ease;
    }

    .site--break {
    background-color: $secondary;
    }

    .site__content {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    }

    .container {
    padding: 0 1rem;
    margin: 0 auto;
    width: 100%;
    max-width: 1200px;
    }

    .filter {
    margin-bottom: 24px;
    }

    .filter__title {
    color: #333;
    }

    .filter__time {
    color: #474747;
    }

    .filter__reset-btn {
    position: absolute;
    bottom: 3rem;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #333;
    }

    /* input[type=range] reset */
    input[type=range] {
    -webkit-appearance: none; /* Hides the slider so that custom slider can be made */
    width: 100%; /* Specific width is required for Firefox. */
    background: transparent; /* Otherwise white in Chrome */
    }

    input[type=range]::-webkit-slider-thumb {
    -webkit-appearance: none;
    }

    input[type=range]:focus {
    outline: none; /* Removes the blue border. You should probably do some kind of focus styling for accessibility reasons though. */
    }

    input[type=range]::-ms-track {
    width: 100%;
    cursor: pointer;

    /* Hides the slider so custom styles can be added */
    background: transparent;
    border-color: transparent;
    color: transparent;
    }
    /* input[type=range] custom
    * THUMB
    */

    /* Special styling for WebKit/Blink */
    input[type=range]::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 14px;
    width: 14px;
    border-radius: 50%;
    background: #d9534f;
    cursor: pointer;
    margin-top: -6px; /* You need to specify a margin in Chrome, but in Firefox and IE it is automatic */
    }

    /* All the same stuff for Firefox */
    input[type=range]::-moz-range-thumb {
    border: 0;
    height: 14px;
    width: 14px;
    border-radius: 50%;
    background: #d9534f;
    cursor: pointer;
    }

    /* All the same stuff for IE */
    input[type=range]::-ms-thumb {
    border: 0;
    height: 14px;
    width: 14px;
    border-radius: 50%;
    background: #d9534f;
    cursor: pointer;
    }

    /* input[type=range] custom
    * TRACK
    */

    input[type=range]::-webkit-slider-runnable-track {
    width: 100%;
    height: 2px;
    cursor: pointer;
    background: #E1E1E1;
    border: 0;
    }

    input[type=range]:focus::-webkit-slider-runnable-track {
    background: #E1E1E1;
    }

    input[type=range]::-moz-range-track {
    width: 100%;
    height: 2px;
    cursor: pointer;
    background: #E1E1E1;
    border: 0;
    }

    input[type=range]::-ms-track {
    width: 100%;
    height: 2px;
    cursor: pointer;
    background: transparent;
    border-color: transparent;
    border-width: 16px 0;
    color: transparent;
    }
    input[type=range]::-ms-fill-lower {
    background: #E1E1E1;
    border: 0;
    }
    input[type=range]:focus::-ms-fill-lower {
    background: #E1E1E1;
    }
    input[type=range]::-ms-fill-upper {
    background: #E1E1E1;
    border: 0;
    border-radius: 0;
    box-shadow: 0;
    }
    input[type=range]:focus::-ms-fill-upper {
    background: #E1E1E1;
    }

    // Main
    .timer {
    position: relative;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    flex-flow: column wrap;
    max-width: 224px;
    height: 224px;
    border: 4px solid $white;
    border-radius: 50%;
    
    &::before,
    &::after {
        content: "";
        display: block;
        position: absolute;
        top: 50%;
        left: 50%;
        border: 1px solid rgba(255, 255, 255, .25);
        border-radius: 50%;
        transform: translate(-50%, -50%);
    }
    
    &::before {
        width: 120%;
        height: 120%;
    }
    
    &::after {
        width: 80%;
        height: 80%;
    }
    }

    .timer__session {
    font-weight: 500;
    }

    .timer__countdown {
    font-size: 2.5rem;
    }

</style>