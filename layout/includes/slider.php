<?php
// add head comment here 

defined('MOODLE_INTERNAL') || die();

// Require the necessary libraries.
require_once($CFG->dirroot.'/theme/boost_union/locallib.php');

// Get theme config.
$config = get_config('theme_boost_union');

$generalsettings = new stdClass();
$generalsettings->show = $config->{'slideractivatedsetting'};
$generalsettings->showarrownav = $config->{'sliderarrownavsetting'};
$generalsettings->showindicatornav = $config->{'sliderindicatornavsetting'};
$generalsettings->showcaptions = $config->{'slidercaptionsetting'};
$generalsettings->showcontent = $config->{'slidercontentsetting'};
$generalsettings->animation = $config->{'slideranimationsetting'};
$generalsettings->interval = $config->{'sliderintervalsetting'};


$templatecontext['slidergeneralsettings'] = $generalsettings;

$slides = array();
for ($i = 1; $i <= THEME_BOOST_UNION_SETTING_SLIDES_COUNT; $i++){
    $slider_content = new stdClass();
    $slider_content->image = $config->{'oneslidepickimage'.$i};
    $slider_content->imagetitle = $config->{'oneslideimagetitle'.$i};
    $slider_content->link = $config->{'oneslidelink'.$i};
    $slider_content->linktitle = $config->{'oneslidelinktitle'.$i};
    $slider_content->caption = $config->{'oneslidecaption'.$i};
    $slider_content->content = $config->{'oneslidecontent'.$i};
    array_push($slides,$slider_content);
}
$templatecontext['slidecontent'] = $slides;


/*
// example input for now
$slider_content = array (
    array ("Header ONE", "Text ONE"),
    array ("Header TWO", "Text TWO"),
    array ("Header THREE", "Text THREE")
);

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
*/
