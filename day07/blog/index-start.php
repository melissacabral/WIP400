<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Simple PHP + MySQL Blog</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<h1><a href="index.php">PHP + MySQL Blog</a></h1>
	</header>
	<main>
		
		<article>
			<h2>
				<a href="PATH-TO-SINGLE">
					TITLE
				</a>
			</h2>
			<p>
				BODY
			</p>
			<footer class="post-info">		
				<time class="date" datetime="TIMESTAMP">
					on DATE
				</time>
			</footer>
		</article>

	</main>
	<aside class="sidebar">
		<section>
			<h2>Latest Posts</h2>
			<ul>			
				<li><a href="#">TITLE</a></li>
				<li><a href="#">TITLE</a></li>
				<li><a href="#">TITLE</a></li>
			</ul>
		</section>
		<section>
			<h2>Post Categories</h2>
			<ul>
				<li><a href="#">NAME</a></li>
				<li><a href="#">NAME</a></li>
				<li><a href="#">NAME</a></li>
			</ul>
		</section>
		<section>
			<h2>Links</h2>
			<ul>
				<li><a href="URL">TITLE</a></li>
				<li><a href="URL">TITLE</a></li>
				<li><a href="URL">TITLE</a></li>
			</ul>
		</section>
	</aside>
	<footer>
		<small>&copy; 2015 Your Name Here!</small>
	</footer>
</body>
</html>