@theme @theme_boost_union @theme_boost_union_contentsettings @theme_boost_union_contentsettings_slider @javascript @_file_upload
Feature: Configuring the theme_boost_union plugin for the "Slider" tab on the "Content" page
  In order to use the features
  As admin
  I need to be able to configure the theme Boost Union plugin


Background:
  Given the following config values are set as admin:
     | debug          | 0 |
     | debugdisplay   | 0 |
   And the following config values are set as admin:
     | config                 | value          | plugin            |
     | slideractivatedsetting | 1              | theme_boost_union |
     | slidercaptionsetting   | 1              | theme_boost_union |
     | slidercontentsetting   | 1              | theme_boost_union |
     | slide1enabled          | yes            | theme_boost_union |
    And I log in as "admin"
    And I navigate to "Appearance > Boost Union > Content" in site administration
    And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Slide 1 Image" filemanager
    And I press "Save changes"


Scenario Outline: Setting: Slider - Display Slider on Frontpage When activated
  Given the following config values are set as admin:
   | config                 | value                    | plugin            |
   | slideractivatedsetting | <setting>                | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" <shouldnotexist>

  Examples:
   | setting  | shouldnotexist    |
   | 0        | should not exist  |
   | 1        | should exist      |


Scenario: Slider does not appear on any other page than frontpage - e.g. Dashboard
  When I follow "Dashboard"
  Then ".boost-union-frontpage-slider" "css_element" should not exist


Scenario: Slider does not appear on any other page than frontpage - e.g. Course
  Given the following "courses" exist:
   | shortname | fullname |
   | C1        | Course 1 |
    And I log in as "admin"
    And I am on "Course 1" course homepage
  Then ".boost-union-frontpage-slider" "css_element" should not exist


Scenario Outline: Setting: Slider position - Display Slider before or after main content of site home
  Given the following config values are set as admin:
   | config                    | value              | plugin            |
   | sliderpositiononfrontpage | <position>         | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should appear <beforeafter> "#region-main" "css_element"

  Examples:
    | position | beforeafter |
    | 1        | before      |
    | 2        | after       |


Scenario Outline: Setting: Enable/Disable Indicator & Arrow navigation
  Given the following config values are set as admin:
   | config                      | value           | plugin            |
   | sliderarrownavsetting       | <setting>       | theme_boost_union |
   | sliderindicatornavsetting   | <setting>       | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider #slider .carousel-control-next" "css_element" <shouldnotexist>
  And ".boost-union-frontpage-slider #slider .carousel-indicators" "css_element" <shouldnotexist>

  Examples:
   | setting | shouldnotexist   |
   | 1       | should exist     |
   | 0       | should not exist |


Scenario Outline: Setting: Pick Slide Animation
  Given the following config values are set as admin:
   | config                      | value           | plugin            |
   | slideranimationsetting      | <setting>       | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider <animation>" "css_element" <shouldnotexist>

  Examples:
   | setting | animation             | shouldnotexist    |
   | 0       | .slide                | should exist      |
   | 1       | .carousel-fade        | should exist      |
   | 2       | .slide                | should not exist  |
   | 2       | .carousel-fade        | should not exist  |


Scenario Outline: Setting: Slideshow interval speed
  Given the following config values are set as admin:
   | config                    | value           | plugin            |
   | sliderintervalsetting     | <setting>       | theme_boost_union |
  When I am on site homepage
  Then the "data-interval" attribute of "#slider" "css_element" should contain "<speed>"

  Examples:
   | setting | speed     |
   | 500     | 1000      |
   | 4321    | 4321      |
   | 10001   | 10000     |


Scenario: No picture no slide
  When I log in as "admin"
    And I navigate to "Appearance > Boost Union > Content" in site administration
    And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I delete "login_bg1.jpg" from "Slide 1 Image" filemanager
    And I press "Save changes"
    And I am on site homepage
  Then ".boost-union-frontpage-slider .carousel-item" "css_element" should not exist


Scenario: Disable Slide
  Given the following config values are set as admin:
   | config                 | value          | plugin            |
   | slide1enabled          | no             | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider .carousel-item" "css_element" should not exist

Scenario: Image Title
  Given the following config values are set as admin:
   | config                 | value                           | plugin            |
   | oneslideimagetitle1    | This is an image description    | theme_boost_union |
  When I am on site homepage
  Then the "alt" attribute of ".boost-union-frontpage-slider .carousel-item img" "css_element" should contain "This is an image description"


Scenario: Link & Link title
  Given the following config values are set as admin:
   | config              | value                                 | plugin            |
   | oneslidelink1       | https://moodlenrw.de/                 | theme_boost_union |
   | oneslidelinktitle1  | Visit the Moodle.NRW Knowledge Base!  | theme_boost_union |
   When I am on site homepage
   Then the "href" attribute of ".boost-union-frontpage-slider .carousel-item a" "css_element" should contain "https://moodlenrw.de/"
   And the "title" attribute of ".boost-union-frontpage-slider .carousel-item a" "css_element" should contain "Visit the Moodle.NRW Knowledge Base!"


Scenario: Caption & Content Texts
  Given the following config values are set as admin:
   | config                 | value          | plugin            |
   | oneslidecaption1       | Caption Text   | theme_boost_union |
   | oneslidecontent1       | Content Text   | theme_boost_union |
  When I am on site homepage
  Then I should see "Caption Text" in the ".boost-union-frontpage-slider .carousel-item .carousel-caption h5" "css_element"
  And I should see "Content Text" in the ".boost-union-frontpage-slider .carousel-item .carousel-caption p" "css_element"

@ezylryb #NOT yet working (text not found)! ToDo: Scroll down, take screenshot, confirm whether it's there or not
Scenario: Slides really do the sliding
  Given the following config values are set as admin:
   | config                 | value          | plugin            |
   | sliderintervalsetting  | 1000           | theme_boost_union |
   | slide2enabled          | yes            | theme_boost_union |
   | oneslidecaption2       | Slide Two      | theme_boost_union |
  When I log in as "admin"
    And I navigate to "Appearance > Boost Union > Content" in site administration
    And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I upload "theme/boost_union/tests/fixtures/moodlelogo.png" file to "Slide 2 Image" filemanager
    And I press "Save changes"
    And I am on site homepage
    And I wait "2" seconds
  Then I should see "Slide Two" in the ".boost-union-frontpage-slider .carousel-item .carousel-caption h5" "css_element"