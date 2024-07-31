<script setup lang="ts">
import { onMounted, ref } from 'vue'
import NavBarHome from '@/components/NavBarHome.vue'
import ProejctListHome from '@/components/ProejctListHome.vue'

const { frontmatter } = defineProps({
  frontmatter: {
    type: Object,
    required: true,
  },
})

const columnWidth = ref('0px')

function resizeColumnWidth() {
  const contentElement = document.querySelector('.content')
  if (contentElement) {
    const gridTemplateColumns = getComputedStyle(contentElement).gridTemplateColumns
    const columns = gridTemplateColumns.split(' ')
    console.log(columns)
    if (columns.length === 2) {
      columnWidth.value = columns[1]
    }
  }
}

onMounted(() => {
  resizeColumnWidth()
  window.addEventListener('resize', resizeColumnWidth)
})
</script>

<template>
  <div
    class="left"
  >
    <section class="information">
      <h1 class="name-surname">
        {{ frontmatter.name }}
        <span class="name-surname-divider">
          {{ frontmatter.surname }}
        </span>
      </h1>
      <div>
        <h2>
          {{ frontmatter.personalTitle }}
        </h2>
        <p class="description">
          {{ frontmatter.personalDescription }}
        </p>
        <p class="description">
          {{ frontmatter.personalDescription2 }}
        </p>
      </div>
    </section>
    <NavBarHome />
  </div>
  <ProejctListHome :projects="frontmatter.projects" :column-width="columnWidth" />
</template>

<style>
.left {
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

h1 {
  font-size: var(--font-size-64);
  line-height: 0.8;
  font-weight: 700;
}
h2 {
  font-size: var(--font-size-15);
  font-weight: 700;
}

.description{
  font-size: var(--font-size-8);
  font-weight: 700;
}

.information {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.name-surname {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
}
.name-surname-divider {
  margin-left: calc(1ch / 2);
}

@media (max-width: 1366px) {
  h1 {
    font-size: var(--font-size-48);
  }
}

@media (max-width: 1152px) {
  h1 {
  }
}

@media (max-width: 1024px) {
  h1 {
    font-size: var(--font-size-36);
  }
}
@media (max-width: 762px) {
  h1 {
    font-size: var(--font-size-31);
  }
  h2 {
    font-size: var(--font-size-13);
  }
  .description{
    font-size: var(--font-size-7);
  }

}
</style>

<style>
.content{
  display: grid;
  width: 100%;
  grid-template-columns: 2fr 1fr;
  height: 100dvh;
  gap: var(--spacing-12);
  padding: var(--spacing-18) var(--spacing-36);
  overflow-y: hidden;
}

@media (max-width: 1366px) {
  .content{
    padding: var(--spacing-12) var(--spacing-16);
    gap: var(--spacing-18);
  }
}

@media (max-width: 1152px) {

}

@media (max-width: 1024px) {
}
@media (max-width: 762px) {
  .content{
    grid-template-columns: 1fr 1fr;
    padding: var(--spacing-12) var(--spacing-6);
  }
}
</style>
