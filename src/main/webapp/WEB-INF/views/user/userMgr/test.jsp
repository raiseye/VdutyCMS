<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
     <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title>validation component example</title>
    <script src="/public/lib/vue.min.js"></script>
  
    <style>
      input.invalid { border-color: red; }
      .errors { color: red; }
    </style>
  </head>
  <body>
<div id="app">
  <p>{{ message }}</p>
</div>

<script>
new Vue({
  el: '#app',
  data: {
    message: '<a href="www.appxp.com">appxp</a>'
  }
})
</script>
</body>
</html>