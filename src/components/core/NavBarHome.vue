<script setup lang="ts">

</script>

<template>
  <nav>
    <ul>
      <!--      <li> -->
      <!--        <RouterLink -->
      <!--          to="/projects" -->
      <!--        > -->
      <!--          <span>Projects</span> -->
      <!--        </RouterLink> -->
      <!--      </li> -->
      <li>
        <a
          href="mailto:cemalturkcann@gmail.com"
        >
          <span>
            Contact
          </span>
        </a>
      </li>
      <li>
        <a
          href="/cemalturkcan.pdf"
          target="_blank"
        >
          <span>
            CV
          </span>
        </a>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
nav {
  position: relative;
  z-index: 1;
}
ul {
  display: flex;
  gap: var(--spacing-6);
  font-size: var(--font-size-9);
  font-weight: 500;
}
@media (max-width: 1024px) {
  nav {
    position: fixed;
    top: 50%;
    left: var(--spacing-16);
    transform: translateY(-50%);
  }
}

@media (max-width: 762px) {
  nav {
    left: var(--spacing-6);
  }
}

@media (max-width: 550px) {
  nav {
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    right: 0;
    transform: translateY(0);
    padding: var(--spacing-6)
  }
  ul {
    justify-content: flex-end;
  }
}
</style>
