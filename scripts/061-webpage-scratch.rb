# Given an object:

obj = {first_name: 'John', last_name: 'Doe'}


str = %Q{
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Webpage for</title>
</head>
<body>

<h1>#{obj[:first_name] obj[:last_name]}</h1>

</body>
</html>
}

