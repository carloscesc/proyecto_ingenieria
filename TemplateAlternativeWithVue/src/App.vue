<template>
  <div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    background: {
      path: '/static/doc-images/background.jpg'
    }
  })
}
</script>

<style>
body {
  background-image: url('/static/doc-images/background.jpg');
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
</style>


