<script setup lang="ts">
import { Vector2 } from 'three'
import { useLoop } from '@tresjs/core'
import { ref, shallowRef } from 'vue'
import vertexShader from '@/glsl/vertex.glsl'
import fragmentShader from '@/glsl/fragment.glsl'

const { onBeforeRender } = useLoop()
const mesh = shallowRef<any>(null)

const resolutionScale = 0.3

const uniforms = ref({
  iTime: { value: 0.0 },
  iTimeDelta: { value: 0.0 },
  iResolution: { value: new Vector2(window.innerWidth * resolutionScale, window.innerHeight * resolutionScale) },
})

let lastFrameTime = 0
const targetFPS = 30

onBeforeRender(({ elapsed }) => {
  const now = performance.now()
  const delta = now - lastFrameTime

  if (delta < 1000 / targetFPS)
    return
  lastFrameTime = now
  uniforms.value.iTime.value = elapsed * 0.1
})
</script>

<template>
  <TresPerspectiveCamera :position="[0, 0, 1]" :near="0.1" :far="1000" />
  <TresMesh ref="mesh">
    <PlaneGeometry :args="[2, 2]" />
    <TresShaderMaterial
      :uniforms="uniforms"
      :fragment-shader="fragmentShader"
      :vertex-shader="vertexShader"
    />
  </TresMesh>
</template>

<style scoped>
body, html {
  margin: 0;
  overflow: hidden;
  width: 100%;
  height: 100%;
}
</style>
