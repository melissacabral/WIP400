<?php 
/**
 * Convert MySQL datetime format into a human-friendly display date
 * @param  string $dateR the datetime string like 2015-04-02 09:58:43
 * @return string        a nice date like April 2, 2015
 * @since  Day 7 
 */
function convert_date($uglydate){
	$date = new DateTime($uglydate);
	$nicedate = $date->format('F j, Y');
	return $nicedate;
}
/**
 * Count the number of comments on any post
 * @param int $post_id any valid post_id to count the comments for
 * @since  Day 8
 */
function count_comments( $post_id, $show_text = false ){
	//access the $db connection from outside this function
	global $db;

	//count all the published comments on the post_id
	$query 	 = "SELECT COUNT(*) AS total
				FROM comments 
				WHERE is_approved = 1
				AND post_id = $post_id";
	$result = $db->query( $query );
	//check to make sure it worked. COUNT should return exactly one row. 
	if( $result->num_rows == 1 ){
		//while loop can be skipped since we only have one row
		while($row = $result->fetch_assoc()){
			if($show_text){
				//display comment count with good grammar!
				if( $row['total'] == 1 ){
					echo 'One comment';
				}elseif( $row['total'] == 0 ){
					echo 'No comments yet';
				}else{
					echo $row['total'] . ' comments';
				}//end of grammar
			}else{
				echo '<span class="comment-number">' . $row['total'] . '</span>';
			}//end if show_text
		}//end while
		$result->free();
	}//end if comments
}//end count_comments function



/**
 * Count the number of published posts in any category
 * @param int $cat_id any valid category_id
 * @since  Day 8 
 */
function count_posts_in_category($cat_id){
	global $db;
	$query = "SELECT COUNT(*) AS total
			FROM  posts
			WHERE category_id = $cat_id
			AND is_published = 1";
	$result = $db->query($query);
	//check it
	if( $result->num_rows == 1 ){
		//only one result possible, so while() can be omitted
		$row = $result->fetch_assoc();

		echo '(' . $row['total'] . ')';
		$result->free();
	}
}

/**
 * Display comments for any posts in a list 	
 * @param  int $post_id - The post you want to show comments for
 * @since  Day 9
 */

function mmc_list_comments( $post_id ){
	global $db;
	//get comments for this post
	$query = "SELECT comments.body, comments.date, users.username 
			FROM comments, users
			WHERE comments.is_approved = 1
			AND comments.user_id = users.user_id
			AND comments.post_id = $post_id
			ORDER BY comments.date ASC
			LIMIT 20";
	$result = $db->query($query);
	if($result->num_rows >= 1){ ?>

	<section class="comments">
		<h3>Comments:</h3>
		<ul>
			<?php while($row = $result->fetch_assoc()){ ?>
			<li>
				<h4>From: <b><?php echo $row['username'] ?></b> on <?php echo convert_date($row['date']) ?></h4>
				<p><?php echo $row['body'] ?></p>
			</li>
			<?php }
			$result->free(); ?>
		</ul>
	</section>
	<?php } 
}


//no close PHP