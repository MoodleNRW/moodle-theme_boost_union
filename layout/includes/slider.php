<?php
// add head comment here 

defined('MOODLE_INTERNAL') || die();

// Require the necessary libraries.
require_once($CFG->dirroot.'/theme/boost_union/locallib.php');

// Get theme config.
$config = get_config('theme_boost_union');

$generalsettings = new stdClass();
$generalsettings->show = $config->{'slideractivatedsetting'};

// Getting and setting the Slider position on the frontpage.
switch ($config->{'sliderpositiononfrontpage'}) {
    case THEME_BOOST_UNION_SETTING_SLIDER_FRONTPAGEPOSITION_BEFORE:
        $templatecontext['sliderpositionbefore'] = true;
        $templatecontext['sliderpositionafter'] = false;
        break;
    case THEME_BOOST_UNION_SETTING_SLIDER_FRONTPAGEPOSITION_AFTER:
        $templatecontext['sliderpositionbefore'] = false;
        $templatecontext['sliderpositionafter'] = true;
}

$generalsettings->showarrownav = $config->{'sliderarrownavsetting'};
$generalsettings->showindicatornav = $config->{'sliderindicatornavsetting'};
$generalsettings->showcaption = $config->{'slidercaptionsetting'};
$generalsettings->showcontent = $config->{'slidercontentsetting'};

if ($generalsettings->show) {
    switch ($config->{'slideranimationsetting'}) {
        case 0:
            $generalsettings->animation = "slide";
            break;
        case 1:
            $generalsettings->animation = "slide carousel-fade";
            break;
        case 2:
            $generalsettings->animation = "";
    }
    if ($config->{'sliderintervalsetting'} < 1000) {
        $generalsettings->interval = 1000;
    } elseif ($config->{'sliderintervalsetting'} > 10000) {
        $generalsettings->interval = 10000;
    } else {
        $generalsettings->interval = $config->{'sliderintervalsetting'};
    }
    
    $templatecontext['slidergeneralsettings'] = $generalsettings;
    
    
    $slides = array();
    for ($i = 1; $i <= THEME_BOOST_UNION_SETTING_SLIDES_COUNT; $i++){
        $slider_image = theme_boost_union_get_urlofsliderimage($i);
        if ($slider_image && $config->{'slide'.$i.'enabled'} == THEME_BOOST_UNION_SETTING_SELECT_YES) {
            $slider_content = new stdClass();
            $slider_content->count = count($slides);
            $slider_content->image = $slider_image;
            $slider_content->imagetitle = $config->{'oneslideimagetitle'.$i};
            $slider_content->link = $config->{'oneslidelink'.$i};
            $slider_content->linktitle = $config->{'oneslidelinktitle'.$i};
            $slider_content->caption = $config->{'oneslidecaption'.$i};
            $slider_content->content = $config->{'oneslidecontent'.$i};
            array_push($slides,$slider_content);
        }
        
    }
    $templatecontext['slidecontent'] = $slides;
}