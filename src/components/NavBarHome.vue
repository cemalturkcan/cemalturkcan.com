<script setup lang="ts">

</script>

<template>
  <nav>
    <ul>
      <li>
        <RouterLink
          to="/projects"
        >
          <span>Projects</span>
        </RouterLink>
      </li>
      <li>
        <RouterLink
          to="/contact"
        >
          <span>
            Contact
          </span>
        </RouterLink>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
ul {
  display: flex;
  gap: var(--spacing-6);
  font-size: var(--font-size-9);
  font-weight: 500;
}
</style>
