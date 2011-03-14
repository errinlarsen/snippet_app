require 'spec_helper'

describe "layouts/application.html.haml" do
  before :each do
    render
  end

  it "renders a div for all content" do
    rendered.should have_selector("div#page")
  end

  it "renders a div for the header" do
    rendered.should have_selector("div#header")
  end

  it "renders a logo within the header in an H1 tag" do
    rendered.should have_selector("div#header h1") do |h1|
      h1.should contain("Snippets")
    end
  end

  it "renders a div for the body" do
    rendered.should have_selector("div#body")
  end

  it "renders a div for the footer" do
    rendered.should have_selector("div#footer")
  end
end
