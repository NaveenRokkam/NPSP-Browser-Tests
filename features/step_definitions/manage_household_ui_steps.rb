When(/^I add to household with Add option$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.add_button_element.when_present.disabled? == false
    end
      page.add_button_element.click
  end
end

When(/^I add to household with Add and merge Households option$/) do
  on(ManageHouseholdsPage).add_merge_button_element.when_present.click
end

When(/^I add to household with Add and remove from old Household option$/) do
  on(ManageHouseholdsPage).add_remove_button_element.when_present.click
end

When(/^I click Change on Household Address$/) do
  on(ManageHouseholdsPage).change_address_button_element.when_present.click
end

When(/^I click Enter a new address$/) do
  on(ManageHouseholdsPage).enter_new_element.when_present.click
end

When(/^I click Manage Household$/) do
  on(ManageHouseholdsPage).manage_households_button_element.when_present.click
end

When(/^I click Select an existing address$/) do
  on(ManageHouseholdsPage).select_existing_element.when_present.click
end

When(/^I click Set Address$/) do
  on(ManageHouseholdsPage).set_address_button_element.when_present.click
end

When(/^I click the Accounts tab$/) do
  on(NPSPMainPage).accounts_tab_element.when_present.click
end

When(/^I click the first Household Account$/) do
  on(ManageHouseholdsPage).first_household_link_element.when_present.click
end

When(/^I click the checkboxes in the original address card$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.exclude_household_name_original_element.when_present.disabled? == false
    end
    page.check_exclude_household_name_original

    page.wait_until do
      page.exclude_formal_greeting_original_element.disabled? == false
    end
    page.check_exclude_formal_greeting_original

    page.wait_until do
      page.exclude_informal_greeting_original_element.disabled? == false
    end
    page.check_exclude_informal_greeting_original
  end
end

When(/^I click the checkboxes in the second address card$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.exclude_household_name_second_element.disabled? == false
    end
    page.check_exclude_household_name_second

    page.wait_until do
      page.exclude_formal_greeting_second_element.disabled? == false
    end
    page.check_exclude_formal_greeting_second

    page.wait_until do
      page.exclude_informal_greeting_second_element.disabled? == false
    end
    page.check_exclude_informal_greeting_second
  end
end

When(/^I click the three Auto checkboxes$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.auto_name_element.disabled? == false
    end
    page.check_auto_name

    page.wait_until do
      page.auto_formal_greeting_element.disabled? == false
    end
    page.check_auto_formal_greeting

    page.wait_until do
      page.auto_informal_greeting_element.disabled? == false
    end
    page.check_auto_informal_greeting
  end
end

When(/^I fill in the five address fields$/) do
  on(ManageHouseholdsPage) do |page|
    page.change_street_element.when_present.send_keys('street')
    page.change_city_element.when_present.send_keys('city')
    page.change_state_element.when_present.send_keys('state')
    page.change_zip_element.when_present.send_keys('zip')
    page.change_country_element.when_present.send_keys('country')
  end
end

When(/^I select "([^"]*)" and Go$/) do |account_view|
  on(ManageHouseholdsPage) do |page|
      page.view_select_list=account_view
      page.go_button_element.when_present.click
    end
  end

When(/^I select the first result$/) do
  on(ManageHouseholdsPage).first_member_add_button_element.when_present.click
end

When(/^I type "([^"]*)" into search box$/) do |search_string|
  on(ManageHouseholdsPage).member_search_box_element.when_present.click #search box needs focus for Chrome
  on(ManageHouseholdsPage).member_search_box_element.when_present.send_keys search_string
end

Then(/^I should see all three checkboxes checked$/) do
  on(ManageHouseholdsPage) do |page|
    expect(page.exclude_formal_greeting_original_checked?).to be true
    expect(page.exclude_informal_greeting_original_checked?).to be true
    expect(page.exclude_household_name_original_checked?).to be true
  end
end

Then(/^I should see the Add Members search field$/) do
  expect(on(ManageHouseholdsPage).add_members_search_element.when_present).to be_visible
end

Then(/^I should see the Household Details section$/) do
  expect(on(ManageHouseholdsPage).household_details_element.when_present).to be_visible
end

Then(/^I should see the Household Members section$/) do
  expect(on(ManageHouseholdsPage).household_members_section_element.when_present).to be_visible
end

Then(/^I should see the Household Naming section$/) do
  expect(on(ManageHouseholdsPage).household_naming_element.when_present).to be_visible
end

Then(/^I should see two Household Member entries$/) do
  on(ManageHouseholdsPage) do |page|
    expect(page.household_member_second_element.when_present).to be_visible
    expect(page.household_member_first_element.when_present).to be_visible
  end
end

Then(/^the five address fields should appear in the Household Address section in the correct order$/) do
  expect(on(ManageHouseholdsPage).household_address_field).to match /street.+city.+state.+zip.+country/m
end

Then(/^I should be on the regular Households page$/) do
  expect(on(ManageHouseholdsPage).regular_page_detail_block_element.when_present).to be_visible
end
