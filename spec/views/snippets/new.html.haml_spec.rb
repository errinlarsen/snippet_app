require 'spec_helper'

describe "snippets/new.html.haml" do
  before do
    assign(:snippet, mock_model("Snippet").as_new_record.as_null_object)
    render
  end

  it "renders a div for the snippet form" do
    rendered.should have_selector("div#snippet")
  end
  
  it "renders a form to create a new snippet" do
    rendered.should have_selector("form", :method => "post", :action => snippets_path) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end

  it "renders a label and text field for the new snippet's name" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :for => "snippet_name")
      form.should have_selector("input#snippet_name", :type => "text", :name => "snippet[name]")
    end
  end

  it "renders a select field for the new snippet's type" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select#snippet_type", :name => "snippet[type]")
    end
  end

  it "renders a label and text field for the new snippet's description" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :for => "snippet_description")
      form.should have_selector("input#snippet_description", :type => "text", :name => "snippet[description]")
    end
  end

  it "renders a label and text field for the new snippet's tags" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :for => "snippet_tags")
      form.should have_selector("input#snippet_tags", :type => "text", :name => "snippet[tags]")
    end
  end

  it "renders a label and textarea for the new snippet's text" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :for => "snippet_text")
      form.should have_selector("textarea#snippet_text", :name => "snippet[text]")
    end
  end
end
