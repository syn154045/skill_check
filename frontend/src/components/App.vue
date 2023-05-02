<template>
  <div>
    <h1>{{ text }}</h1>
    <div>count: {{ state.count }}</div>
    <div>
      <button @click="countUp()">count up</button>
      <button @click="countDown()">count down</button>
    </div>
  </div>
</template>

<script>
import { defineComponent, reactive } from '@vue/composition-api';

export default defineComponent({
  setup(_props, _context) {
    const state = reactive({
      count: 0
    })
    return {
      state,
      text: 'start vue',
      countUp() {
        state.count++;
      },
      countDown() {
        state.count--;
      }
    };
  }
});
</script>

<style>
h1 {
  color: blue;
}
</style>
