<?php 
/**
 * Convert MySQL datetime format into a human-friendly display date
 * @param  string $date the datetime string like 2015-04-02 09:58:43
 * @return string        a nice looking date like April 2, 2015
 * @since  Day 7 
 */
function convert_date($uglydate){
	$date = new DateTime($uglydate);
	$nicedate = $date->format('F j, Y');
	return $nicedate;
}

//no close PHP