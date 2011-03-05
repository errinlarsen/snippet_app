require 'spec_helper'

describe "snippet/index.html.haml", :type => :request do
  it "displays a welcome message in an H1 tag" do
    visit '/'
    within( 'h1' ) { page.should have_content( 'Welcome to Snippets!' )}
  end
end
