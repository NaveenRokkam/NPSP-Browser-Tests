Feature: NPSP Settings People Account Model

  Background:
    Given I click the NPSP Settings link
    When I navigate to Settings People Account Model
      And I retrieve current settings for Account Model, Household Account Record Type, One-to-One Record Type

@smoketest
  Scenario: Account Model set values
    When I set Account Model to "One-to-One"
      And I set Account Model to "Individual"
      And I set Household Account Record Type to "Organization"
      And I set Household Account Record Type to "- none -"
      And I set One-to-One Record Type to "Household Account"
      And I set One-to-One Record Type to "Organization"
      And I click Cancel
      And I wait for the page to revert
    Then I should see the default Account Model settings on the page
