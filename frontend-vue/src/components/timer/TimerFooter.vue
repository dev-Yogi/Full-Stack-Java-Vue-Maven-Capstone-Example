<template>
      <footer>
    <div class="container">
      <div class="controls">

        <button @click="reset" title="reset" class="btn-sm">
          <svg width="16" height="20" xmlns="http://www.w3.org/2000/svg"><path d="M8 4.023c4.398 0 8 3.556 8 7.954 0 4.397-3.602 8-8 8s-8-3.603-8-8h2.012A5.97 5.97 0 0 0 8 17.965a5.97 5.97 0 0 0 5.988-5.988A5.97 5.97 0 0 0 8 5.988v4.024L2.994 5.006 8 0v4.023z" fill="#FFF" fill-rule="nonzero"/></svg>
        </button>

        <button @click="toggleTimer" class="btn-md">
          <span v-if="isTimerActive" class="flex-center">
            <svg width="12" height="14" xmlns="http://www.w3.org/2000/svg"><path d="M8.016.016H12v13.968H8.016V.016zM0 13.984V.016h3.984v13.968H0z" fill="#FFF" fill-rule="nonzero"/></svg>
          </span>
          <span v-else class="flex-center">
            <svg width="14" height="18" xmlns="http://www.w3.org/2000/svg"><path d="M0 0l14 9-14 9z" fill="#FFF" fill-rule="nonzero"/></svg>
          </span>
        </button>

        <button title="info" class="btn-sm" @click="toggleModal">
          <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path d="M9.016 7V4.984h1.968V7H9.016zM10 18.016c4.406 0 8.016-3.61 8.016-8.016 0-4.406-3.61-8.016-8.016-8.016-4.406 0-8.016 3.61-8.016 8.016 0 4.406 3.61 8.016 8.016 8.016zm0-18A9.963 9.963 0 0 1 19.984 10 9.963 9.963 0 0 1 10 19.984 9.963 9.963 0 0 1 .016 10 9.963 9.963 0 0 1 10 .016zm-.984 15v-6h1.968v6H9.016z" fill="#FFF" fill-rule="nonzero"/></svg>
        </button>
      </div>
    </div>
  </footer>

</template>
<script>
export default {
  props: [
    'isTimerActive',
  ],
  methods: {
    toggleTimer() {
      this.$emit('toggle-timer');
    },
    reset() {
      this.$emit('reset');
    },
    toggleModal() {
      this.$emit('toggle-modal');
    }
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

    .container {
    padding: 0 1rem;
    margin: 0 auto;
    width: 100%;
    max-width: 1200px;
    }

    // Footer
    button {
    padding: 0;
    color: $white;
    font-family: inherit;
    font-size: 1rem;
    background-color: transparent;
    border: 0;
    outline: 0;
    user-select: none;
    transition: border-color .15s ease;
    
    &:not(:disabled) {
        cursor: pointer;
    }
    }

    .controls {
    padding-bottom: 24px;
    display: flex;
    flex-flow: row wrap;
    align-items: center;
    justify-content: center;
    }

    .btn-sm {
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: calc(3rem + 4px);
    height: calc(3rem + 4px);
    line-height: 3rem;
    border: 2px solid rgba(255, 255, 255, .25);
    border-radius: 50%;
    }

    .btn-md {
    margin: 1.5rem 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: calc(4rem + 4px);
    height: calc(4rem + 4px);
    line-height: 3rem;
    border: 2px solid rgba(255, 255, 255, .25);
    border-radius: 50%;
    }

    .btn-sm:hover,
    .btn-md:hover {
    border-color: #fff;
    }

</style>