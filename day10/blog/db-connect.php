<?php 
/*
Database connection credentials
This represents the whole site connecting to the database on the server
it is different from the users who log in to write posts, etc
*/

					//host 		//username 		password     database
$db = new mysqli( 'localhost', 'demo_user', 'password', 'demo_blog' );

//handle any errors by stopping the page
if( $db->connect_errno > 0 ){
	die('Unable to connect to the Database.');
}

// Define constants - these are pieces of data that cannot be changed
// //use in links and src attributes
define( 'SITE_URL', 		'http://localhost/WIP400/day10/blog' );
define( 'SITE_PATH', 		'E:/xampp/htdocs/WIP400/day10/blog' );

//control how errors display (hide notices, show all other errors)
error_reporting(E_ALL & ~E_NOTICE);

// Load the Custom functions 

include_once(SITE_PATH. '/includes/functions.php'); 

//no close PHP