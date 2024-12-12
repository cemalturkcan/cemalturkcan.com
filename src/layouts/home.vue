<script setup lang="ts">
import ShaderContainer from '@/components/core/ShaderContainer.vue'
</script>

<template>
  <main>
    <ClientOnly>
      <ShaderContainer />
    </ClientOnly>
    <RouterView />
  </main>
</template>

<style>

</style>
