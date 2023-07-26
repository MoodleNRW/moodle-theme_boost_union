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
     | slideractivatedsetting | 1              | theme_boost_union |
     | slide1enabled          | yes            | theme_boost_union |
     | slidercaptionsetting   | 1              | theme_boost_union |
     | slidercontentsetting   | 1              | theme_boost_union |
     | oneslidecaption1       | Caption        | theme_boost_union |
     | oneslidecontent1       | Content Text   | theme_boost_union |
    And I log in as "admin"
    And I navigate to "Appearance > Boost Union > Content" in site administration
    And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Slide 1 Image" filemanager
    And I press "Save changes"


Scenario: Setting: Slider - Display Slider on Frontpage When activated
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should exist


Scenario: Setting: Slider - Don't display Slider when deactivated
  Given the following config values are set as admin:
   | config                 | value                    | plugin            |
   | slideractivatedsetting | 0                        | theme_boost_union | 
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should not exist


# SZENARIO: Slider does not appear on dashboard


# SZENARIO: Slider does not appear in created course


# Scenario: Setting: Slider - Display the Slider on the frontpage only and nowhere else
#     Given the following config values are set as admin:

#     When 
#     Then 

#   Scenario Outline: Setting: Slider - Display a Slide only if it is enabled
#     Given the following config values are set as admin:
#       | config       | value                             | plugin            |
#       | tile1enabled | <enabled>                         | theme_boost_union |
#     When I log in as "teacher1"
#     And I am on site homepage
#     Then "#themeboostunionadvtile1" "css_element" <shouldexist>

#     Examples:
#       | enabled | shouldexist      |
#       | yes     | should exist     |
#       | no      | should not exist |

#   Scenario Outline: Setting: Slider - Display the Slider before or after the main output of site home
#     Given the following config values are set as admin:
#       | config                | value                             | plugin            |
#       | tilefrontpageposition | <position>                        | theme_boost_union |
#       # benötigt 1 Bild für 1 Slide
#     When I am on site homepage
#     Then "#themeboostunionadvtiles" "css_element" should appear <beforeafter> "#region-main" "css_element"

#     Examples:
#       | position | beforeafter |
#       | 1        | before      |
#       | 2        | after       |
