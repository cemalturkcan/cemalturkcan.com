import path from 'node:path'
import { defineConfig } from 'vite'
import Vue from '@vitejs/plugin-vue'
import Markdown from 'unplugin-vue-markdown/vite'
import VueRouter from 'unplugin-vue-router/vite'
import Layouts from 'vite-plugin-vue-layouts'
import Components from 'unplugin-vue-components/vite'

// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    alias: {
      '@/': `${path.resolve(__dirname, 'src')}/`,
    },
  },
  plugins: [
    VueRouter({
      extensions: ['.vue', '.md'],
      routesFolder: 'src/pages',
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
      wrapperComponent() {
        return 'MarkdownWrapper'
      },
      wrapperClasses() {
        return ''
      },
    }),
    Layouts(),
    Components({
      extensions: ['vue', 'md'],
      dts: true,
      include: [/\.vue$/, /\.vue\?vue/, /\.md$/],

    }),
  ],
})
