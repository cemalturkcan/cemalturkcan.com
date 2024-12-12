<script lang="ts" setup>
import Shader from '@/components/core/Shader.vue'
</script>

<template>
  <div
    class="tres"
  >
    <TresCanvas>
      <Shader />
    </TresCanvas>
  </div>
</template>

<style scoped>
.tres {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
}
</style>
