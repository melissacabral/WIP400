<?php require('db-connect.php'); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Simple PHP + MySQL Blog</title>
	<link rel="stylesheet" type="text/css" href="<?php echo SITE_URL; ?>/css/style.css">
</head>
<body>
	<header>
		<h1><a href="<?php echo SITE_URL; ?>">PHP &amp; MySQL Blog</a></h1>
	</header>
	<main>
		<?php 
		//set up query to get the newest published post - title & body only. 
		// newest first
		$query = "SELECT title, body, date, post_id 
					FROM posts
					WHERE is_published = 1					
					ORDER BY date DESC";
		//run the query
		$result = $db->query($query); 
		//check to make sure that the result contains data
		if( $result->num_rows >= 1  ){
			//loop through each row in the results
			while($row = $result->fetch_assoc()){
		?>
		<article>
			<h2>
				<a href="PATH-TO-SINGLE">
				<?php echo $row['title']; ?>
				</a>
			</h2>
			<p><?php echo $row['body'] ?></p>
			<footer class="post-info">		
				<time class="date" datetime="<?php echo $row['date']; ?>">
					on <?php echo convert_date($row['date']); ?>
				</time>
			</footer>
		</article>
		
		<?php 
			} //end while loop	
			//we are done with the results, so free the memory/resources
			$result->free();	
		?>
		<?php		
		}else{
			echo '<h2>Sorry, no posts found</h2>';
		} 		
		?>
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