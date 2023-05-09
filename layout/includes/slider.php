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
$generalsettings->showcaption = $config->{'slidercaptionsetting'};
$generalsettings->showcontent = $config->{'slidercontentsetting'};

switch ($config->{'slideranimationsetting'}) {
    case 0:
        $generalsettings->animation = "";
    case 1:
        $generalsettings->animation = "fade";
    case 2:
        $generalsettings->animation = "slide";
}
$generalsettings->interval = $config->{'sliderintervalsetting'};
$templatecontext['slidergeneralsettings'] = $generalsettings;


$slides = array();
for ($i = 1; $i <= THEME_BOOST_UNION_SETTING_SLIDES_COUNT; $i++){
    $slider_image = theme_boost_union_get_urlofsliderimage($i);

    $slider_content = new stdClass();
    //$slider_content->image = $config->{'oneslidepickimage'.$i};
    $slider_content->image = $slider_image;
    $slider_content->imagetitle = $config->{'oneslideimagetitle'.$i};
    $slider_content->link = $config->{'oneslidelink'.$i};
    $slider_content->linktitle = $config->{'oneslidelinktitle'.$i};
    $slider_content->caption = $config->{'oneslidecaption'.$i};
    $slider_content->content = $config->{'oneslidecontent'.$i};
    array_push($slides,$slider_content);
}
$templatecontext['slidecontent'] = $slides;

