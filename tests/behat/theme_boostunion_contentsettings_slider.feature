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
     | slidercontentsetting   | 1              | theme_boost_union |
     | slidercaptionsetting   | 1              | theme_boost_union |
     | oneslidecaption1       | Caption        | theme_boost_union |
     | oneslidecontent1       | Content Text   | theme_boost_union |
    And I log in as "admin"
    And I navigate to "Appearance > Boost Union > Content" in site administration
    And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Slide 1 Image" filemanager
    And I press "Save changes"


Scenario: Setting: Slider - Display Slider with caption and content
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should exist
  And I should see "Caption"
  And I should see "Content Text"

Scenario: Setting: Slider - Display Slider with caption and no content
  Given the following config values are set as admin:
     | slidercontentsetting | 0              | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should exist
  And I should see "Caption"
  But I should not see "Content Text"

Scenario: Setting: Slider - Display Slider with no caption and content
  Given the following config values are set as admin:
     | slidercaptionsetting | 0              | theme_boost_union |
  When I am on site homepage
  Then ".boost-union-frontpage-slider" "css_element" should exist
  And I should not see "Caption"
  But I should see "Content Text"

# TESTSZENARIO - LÖSCHEN
# @javascript @_file_upload
# Scenario: TEST
#   Given the following config values are set as admin:
#    | debug          | 0 |
#    | debugdisplay   | 0 |
#   When I log in as "admin"
#     And I navigate to "Appearance > Boost Union > Content" in site administration
#     And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
#     And I click on "Activate Slider to show on frontpage." "checkbox"
#     And I select "Yes" from the "Enable Slide 1" singleselect
#     And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Slide 1 Image" filemanager
#     And I press "Save changes"
#   Then I should see "Changes saved"
#     And the "Activate Slider to show on frontpage." "checkbox" should be enabled
#     And I am on site homepage
#     And ".boost-union-frontpage-slider" "css_element" should exist


# Background:
#   Given the following config values are set as admin:
#     | config                 | value                    | plugin            |
#     | slideractivatedsetting | yes                      | theme_boost_union |
#     | slide1enabled          | yes                      | theme_boost_union |
#     | oneslidecaption1       | yes                      | theme_boost_union |
#     | oneslideconent1        | yes                      | theme_boost_union |
#     # Set slider Image - NOT WORKING
#     And the following config values are set as admin:
#     | debug          | 0 |
#     | debugdisplay   | 0 |
#     #And I log in as "admin"
#     And I navigate to "Appearance > Boost Union > Content" in site administration
#     And I click on "Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
#     And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Slide 1 Image" filemanager
#     And I press "Save changes"
#     And I am on site homepage
#     And I log out
#     And I am on site homepage
#     And I follow "Log in"
#     And I log in as "teacher1"
#     And I am on site homepage




# Scenario: Setting: Slider - Don't display Slider when deactivated
#   Given the following config values are set as admin:
#     | config                 | value                    | plugin            |
#     | slideractivatedsetting | yes                       | theme_boost_union |
#   When I am on site homepage
#   Then ".boost-union-frontpage-slider" "css_element" should exist


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

#   @javascript @_file_upload
#   Scenario: Setting: Slider - Display the uploaded background image
#     Given the following config values are set as admin:
#       | config       | value                             | plugin            |
#       | tile1enabled | yes                               | theme_boost_union |
#       | tile1content | This is a test content for tile 1 | theme_boost_union |
#       | tile2enabled | no                                | theme_boost_union |
#       | tile2content | This is a test content for tile 2 | theme_boost_union |
#     When I log in as "admin"
#     # We deactivate debugging for a while as the Behat step would otherwise fail due to the
#     # stupid 'Too much data passed as arguments to js_call_amd' debugging message which can't be avoided
#     # on this settings page. This debugging message can't be avoided as we simple use too much hide_if() there.
#     And the following config values are set as admin:
#       | debug          | 0 |
#       | debugdisplay   | 0 |
#     And I navigate to "Appearance > Boost Union > Content" in site administration
#     And I click on "Advertisement tiles" "link" in the "#adminsettings .nav-tabs" "css_element"
#     And I upload "theme/boost_union/tests/fixtures/login_bg1.jpg" file to "Advertisement tile 1 background image" filemanager
#     And I press "Save changes"
#     And I am on site homepage
#     Then "//div[@id='themeboostunionadvtile1']/*[1][contains(@style, 'pluginfile.php/1/theme_boost_union/tilebackgroundimage1/0/login_bg1.jpg')]" "xpath_element" should exist
#     And "//div[@id='themeboostunionadvtile2']/*[1][contains(@style, 'pluginfile.php')]" "xpath_element" should not exist

#   @javascript
#   Scenario: Setting: Advertisement tiles - Show and hide the admin settings based on the main "Enable advertisement tile x" setting
#     Given the following config values are set as admin:
#       | config       | value | plugin            |
#       | tile1enabled | yes   | theme_boost_union |
#     When I log in as "admin"
#     # We deactivate debugging for a while as the Behat step would otherwise fail due to the
#     # stupid 'Too much data passed as arguments to js_call_amd' debugging message which can't be avoided
#     # on this settings page. This debugging message can't be avoided as we simple use too much hide_if() there.
#     And the following config values are set as admin:
#       | debug          | 0 |
#       | debugdisplay   | 0 |
#     And I navigate to "Appearance > Boost Union > Content" in site administration
#     And I click on "Advertisement tiles" "link" in the "#adminsettings .nav-tabs" "css_element"
#     Then "#admin-tile1title" "css_element" should be visible
#     Then "#admin-tile3title" "css_element" should not be visible
#     Then "#admin-tile4title" "css_element" should not be visible
#     And I select "Yes" from the "Enable advertisement tile 4" singleselect
#     Then "#admin-tile1title" "css_element" should be visible
#     Then "#admin-tile3title" "css_element" should not be visible
#     Then "#admin-tile4title" "css_element" should be visible
#     And I select "No" from the "Enable advertisement tile 1" singleselect
#     Then "#admin-tile1title" "css_element" should not be visible
#     Then "#admin-tile3title" "css_element" should not be visible
#     Then "#admin-tile4title" "css_element" should be visible
