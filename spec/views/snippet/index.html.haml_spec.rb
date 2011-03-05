require 'spec_helper'

describe "snippet/index.html.haml", :type => :request do
  it "displays a welcome message" do
    visit '/'
    page.should have_content( 'Welcome to Snippets!' )
  end
end
