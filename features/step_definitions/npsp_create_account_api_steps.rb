#include APIClient

Given(/^I create a new random account via the API$/) do
  create_account_via_api("aaaaaa#{@random_string}")
end

When(/^I navigate to All Accounts$/) do
  step 'I login with oauth'
  step 'I click the Accounts tab'
  step 'I select "All Accounts" and Go'
end

Then(/^I should see the new account is a Household account$/) do
  on(NPSPAllAccountsPage) do |page|
    page.wait_until do
      page.first_account_record.match @random_string
    end
  expect(page.first_account_record).to match @random_string
  expect(page.first_account_record).to match "Household"
  end
  delete_account_via_api
end

Given(/^I delete the random account via the API$/) do
  create_account_via_api("aaaaaa#{@random_string}")
  delete_account_via_api
end

Then(/^I should not see the random account created earlier$/) do
  expect(on(NPSPAllAccountsPage).first_account_record).not_to match @random_string
end