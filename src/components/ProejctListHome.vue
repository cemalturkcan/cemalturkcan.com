<script setup lang="ts">
import type { Project } from '@/types.ts'

const { projects } = defineProps<{
  projects: Record<string, Project[]>
}>()
</script>

<template>
  <section
    class="projects-container"
  >
    <ul
      class="project-list"
    >
      <li
        v-for="(project, id) in Object.keys(projects)"
        :key="id"
        class="project"
      >
        <h3>
          {{ project }}
        </h3>
        <ul
          class="project-items"
        >
          <li
            v-for="(item, idx) in projects[project]"
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
.projects-container {
  position: absolute;
  right: 0;
  top: 0;
  padding-top: var(--spacing-100);
  padding-right: var(--spacing-18);
  overflow-y: auto;
  height: 100dvh;
  scrollbar-width: none;
  -ms-overflow-style: none;
  text-align: right;
}

.project-list {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-12);
  margin-bottom: var(--spacing-12);
}

.project {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-6);
}

.project-items {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-12);
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
  font-size: var(--font-size-23);
  font-weight: 700;
  line-height: 1;
}

.project-desc {
  font-size: var(--font-size-6);
  font-weight: 500;
}

@media (max-width: 1366px) {
  .projects-container {
    padding-right: var(--spacing-16);
  }

  h3 {
    font-size: var(--font-size-7);
  }

  .project-name {
    font-size: var(--font-size-22);
  }

  .project-desc {
    font-size: var(--font-size-6);
  }
}

@media (max-width: 1152px) {
  h3 {
    font-size: var(--font-size-6);
  }

  .project-name {
    font-size: var(--font-size-21);
  }

  .project-desc {
    font-size: var(--font-size-5);
  }
}

@media (max-width: 762px) {
  .projects-container {
    padding-right: var(--spacing-6);
  }

  .project-name {
    font-size: var(--font-size-16);
  }
}

@media (max-width: 550px) {
  .projects-container {
    position: relative;
    text-align: left;
    padding-top: 0;
    height: auto;
  }

  .project-list {
    margin-bottom: 0;
  }
}
</style>
