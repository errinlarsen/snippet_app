require 'spec_helper'

describe "snippet/index.html.haml" do
  before :all do
    lua_snippet = <<EOS
local position = {x=100, y=100, z=7}

function onUse(cid, item, fromPosition)
  doSendMagicEffect(fromPosition, 12)
  doTeleportThing(cid, position)
  doSendMagicEffect(position, 12)
  return true
end
EOS
    c_snippet = <<EOS
#include<stdio.h>
Int main(void)
{
  Int a = 14;
  Int b = 73;
  Subtr = 73 - 14;
    Printf("Tirando %i de %i resulta em %i\\n",a,b,subtr);
    Return 0;
}
EOS
    @recent_snippets = [lua_snippet, c_snippet]
  end

  before :each do
    render
  end

  it "contains a div for all content" do
    puts rendered.inspect
    rendered.should have_selector( 'div#page' )
  end

  it "contains a div for the header" do
    rendered.should have_selector( 'div#header' )
  end

  it "contains a div for the body" do
    rendered.should have_selector( 'div#body' )
  end

  it "contains a div for the sidebar" do
    rendered.should have_selector( 'div#sidebar' ) do |sidebar|
      sidebar.should have_selector( 'ul#recent_snippets' ) do |recent_snippets|
        recent_snippets.should have_selector( 'li', :content => 'Lua snippet' )
        recent_snippets.should have_selector( 'li', :content => 'C snippet' )
      end
    end
  end

  it "contains a div for the snippet form" do
    rendered.should have_selector( 'div#snippet' )
  end

  it "displays a welcome message within the header in an H1 tag" do
    rendered.should have_selector( 'div#header h1' ) do |h1|
      h1.should contain( 'Welcome to Snippets!' )
    end
  end
end
