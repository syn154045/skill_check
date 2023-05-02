import Vue from 'vue';
import VueCompositionApi from '@vue/composition-api';

Vue.use(VueCompositionApi);

// コンポーネントファイルがある場合
import App from './src/components/App.vue';

new Vue({
  el:     '#app',
  render: (h) => h(App),
});
