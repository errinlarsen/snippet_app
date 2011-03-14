require 'cucumber/rspec/doubles'

Given /^a snippet of "([^"]*)" code named "([^"]*)"$/ do |type, name, text|
  snippet = Snippet.new(
    :name => name,
    :tags => "#{type} #{name}",
    :type => type,
    :description => "#{type} #{name} description",
    :text => text
  )

  if @snippets
    @snippets << snippet
  else
    @snippets = Array.new [snippet]
  end
end

Then /^I should see a form that allows me to to paste and save my snippet$/ do
  within "div#snippet form" do
    page.should have_selector("input#snippet_name")
    page.should have_selector("select#snippet_type")
    page.should have_selector("input#snippet_description")
    page.should have_selector("input#snippet_tags")
    page.should have_selector("textarea#snippet_text")
  end
end

