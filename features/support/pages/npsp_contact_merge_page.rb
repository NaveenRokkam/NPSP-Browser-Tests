class NPSPContactMergePage
  include PageObject

  a(:choose_contact_second, text: 'select all', index: 1)
  span(:contact_checkbox_first, class: 'slds-checkbox--faux', index: 0)
  span(:contact_checkbox_second, class: 'slds-checkbox--faux', index: 1)
  span(:contact_checkbox_third, class: 'slds-checkbox--faux', index: 2)
  text_field(:contact_search_box, placeholder: 'Search Contacts')
  button(:contact_search_button, value: 'Search')
  button(:merge_contact_button, text: 'Merge')
  button(:modal_merge_button, class: 'btn slds-button slds-button--destructive')
  button(:next_button, value: 'Next')
  span(:mailing_city1, text: 'aaa3city')
  span(:country3, text: 'aaa1country')
  span(:zip1, text: 'aaa3zip')
  span(:state3, text: 'aaa1state')
end
