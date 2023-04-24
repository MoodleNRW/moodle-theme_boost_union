<?php
// add head comment here 

defined('MOODLE_INTERNAL') || die();

// Require the necessary libraries.
require_once($CFG->dirroot.'/theme/boost_union/locallib.php');

// Get theme config.
$config = get_config('theme_boost_union');

// Get relevant config values.
$slidershow = $config->{'slideractivatedsetting'};


// example input for now

$slider_content = array (
    array ("Header ONE", "Text ONE"),
    array ("Header TWO", "Text TWO"),
    array ("Header THREE", "Text THREE")
);

// only show slider if activated in the settings

$generalsettings = new stdClass();
$generalsettings->show = $config->{'slideractivatedsetting'};

$templatecontext['slidergeneralsettings'] = $generalsettings;


if ($slidershow) {
    $j = 3;
    for ($i = 0; $i < $j; $i++) {
        $sldr = new stdClass();
        $sldr->show = ($slidershow)? true : false;
        $sldr->id = 1;
        $sldr->header = $slider_content[$i][0];
        $sldr->text = $slider_content[$i][1];
        $sldr->active = ($i == 0)? "active" : "";
        
        $slides[$i] = $sldr;
    }
} else {
    $j = 1;
    for ($i = 0; $i < $j; $i++) {
        $sldr = new stdClass();
        $sldr->show = false;
        $sldr->id = 0;
        $sldr->header = "";
        $sldr->text = "";
        $sldr->active = "";
        
        $slides[$i] = $sldr;
    }
}

$templatecontext['slidecontent'] = $slides;