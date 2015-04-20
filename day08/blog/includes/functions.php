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
function count_comments( $post_id ){
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
				echo '<span class="comment-number">' . $row['total'] . '</span>';
		}
		$result->free();
	}//end if 
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

//no close PHP