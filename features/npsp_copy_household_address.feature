Feature: Copy Household Address to/from Contacts

  Background:
   Given I login with oauth
    And I create new Contacts with Household Object via the API
    
  Scenario: Copy Household Address to/from Contacts
    When I navigate to Copy Address page for the Contact
      And I see Mailing City on the default Contact page
      And I see Mailing City on the Household Object page
      And I do not see Mailing City on the other Contact page
      And I click Copy Household Address To Contacts on the Household Object Page
    Then I should see Mailing City on the other Contact page
