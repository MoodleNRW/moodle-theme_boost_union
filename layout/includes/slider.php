<?php
// add head comment here 

defined('MOODLE_INTERNAL') || die();

// Require the necessary libraries.
require_once($CFG->dirroot.'/theme/boost_union/locallib.php');

// Get theme config.
//$config = get_config('theme_boost_union');

$j = 3;
$slider_content = array (
    array ("Header ONE", "Text ONE"),
    array ("Header TWO", "Text TWO"),
    array ("Header THREE", "Text THREE")
);

for ($i = 0; $i < $j; $i++) {
    $slider = array(); 

    $sldr = new stdClass();
    $sldr->header = $slider_content[$i][0];
    $sldr->text = $slider_content[$i][1];
    $sldr->active = ($i == 0)? "active" : "";
    $test[$i] = $sldr;
}


$templatecontext['slider'] = $test;