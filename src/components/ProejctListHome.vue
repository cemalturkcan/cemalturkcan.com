<script setup lang="ts">
import type { Project } from '@/types.ts'

const { projects } = defineProps<{
  projects: Record<string, Project[]>
}>()
</script>

<template>
  <section class="projects">
    <ul
      class="project-list"
    >
      <li
        v-for="project, idx in Object.keys(projects)"
        :key="idx"
        class="project"
      >
        <h3>
          {{ project }}
        </h3>
        <ul
          class="project-items"
        >
          <li
            v-for="item, idx in projects[project]"
            :key="idx"
            class="project-item"
          >
            <span class="project-name">{{ item.name }}</span>
            <span class="project-desc">{{ item.description }}</span>
          </li>
        </ul>
      </li>
    </ul>
  </section>
</template>

<style scoped>
.projects {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  text-align: right;
}
.project-item {
  display: flex;
  flex-direction: column;
}

h3 {
  font-size: var(--font-size-8);
  font-weight: 700;
  margin-bottom: 0.5rem;
}
.project-name {
  font-size: var(--font-size-36);
  font-weight: 700;
  line-height: 1;
}
.project-desc{
  font-size: var(--font-size-8);
  font-weight: 500;
}
</style>
