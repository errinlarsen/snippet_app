Given /^a snippet of "([^"]*)" code$/ do |type, string|
  @snippet_type = type
  @snippet_text = string
end

Then /^I should see a sidebar with previously saved snippets$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a form that allows me to to paste and save my snippet$/ do
  pending # express the regexp above with the code you wish you had
end

