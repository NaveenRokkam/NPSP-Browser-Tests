Feature: Payment wizard test

  Background:
    Given I create a new Opportunity via the API with stage name "Qualification" and close date "2020-01-01" and amount "1000"
    When I navigate to Payment Wizard for that Opportunity

  @smoketest
  Scenario: Invoke default payment wizard
    When I click Calculate Payments
    Then I should see the Payment Wizard fields

  Scenario: Change from 12 to 9 payments and create the payments
    When I change number of payments from 12 to 9
      And I click Calculate Payments
      And I see the screen with nine payments of "111.11"
      And I click Create Payments
      And I click on the ninth link to a Payment record
    Then I should the Payment page
      And the payment amount should be "111.11"


