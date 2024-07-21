import {defineConfig} from 'vite'
import Vue from '@vitejs/plugin-vue'
import Markdown from 'unplugin-vue-markdown/vite'

import VueRouter from 'unplugin-vue-router/vite'

// https://vitejs.dev/config/
export default defineConfig({
    server: {
        port: 3000,
    },
    plugins: [

        VueRouter({
            extensions: ['.vue', '.md'],
            routesFolder: 'pages',
            logs: true,
        }),
        Vue({
            include: [/\.vue$/, /\.md$/],
            script: {
                defineModel: true,
            },
        }),
        Markdown({
            headEnabled: true,
            exportFrontmatter: false,
            exposeFrontmatter: false,
            exposeExcerpt: false,
            markdownItOptions: {
                quotes: '""\'\'',
            },
        }),
    ],
})
