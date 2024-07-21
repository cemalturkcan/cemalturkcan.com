<script setup lang="ts">
import NavBarHome from '@/components/NavBarHome.vue'
import ProejctListHome from '@/components/ProejctListHome.vue'

const { frontmatter } = defineProps({
  frontmatter: {
    type: Object,
    required: true,
  },
})
</script>

<template>
  <div
    class="left"
  >
    <section class="information">
      <h1>
        {{ frontmatter.name }}
        <br>
        &#8203
        {{ frontmatter.surname }}
      </h1>
      <div>
        <h2>
          {{ frontmatter.personalTitle }}
        </h2>
        <p class="description">
          {{ frontmatter.personalDescription }}
        </p>
      </div>
    </section>
    <NavBarHome />
  </div>
  <ProejctListHome />
</template>

<style>
.left {
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

h1 {
  font-size: 9vw;
  line-height: 0.8;
  font-weight: 700;
}
h2 {
  font-size: var(--font-size-14);
  font-weight: 700;
}

.description{
  font-size: var(--font-size-6);
  font-weight: 700;
}

.information {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
</style>

<style>
.content{
  display: grid;
  width: 100%;
  grid-template-columns: 2fr 1fr;
  height: 100vh;
}
</style>
