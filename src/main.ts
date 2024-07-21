import { ViteSSG } from 'vite-ssg'
import App from './App.vue'
import './style.css'
import { routes } from 'vue-router/auto-routes'


export const createApp = ViteSSG(
    App,
    { routes },
    ({  }) => {
    },
)


