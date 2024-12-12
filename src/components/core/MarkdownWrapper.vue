<script setup lang="ts">
const { frontmatter } = defineProps({
  frontmatter: {
    type: Object,
    required: true,
  },
})
</script>

<template>
  <slot />
</template>

<style scoped>

</style>
