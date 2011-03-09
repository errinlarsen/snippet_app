require 'spec_helper'

describe "snippet/index.html.haml" do
  #  The following will be useful soon ...
  #  
#  let( :lua_snippet ) do
#    lua_snippet_text = <<EOS
#local position = {x=100, y=100, z=7}
#
#function onUse(cid, item, fromPosition)
#  doSendMagicEffect(fromPosition, 12)
#  doTeleportThing(cid, position)
#  doSendMagicEffect(position, 12)
#  return true
#end
#EOS
#
#    mock_model( 'Snippet',
#      :name        => 'Lua snippet',
#      :type        => :lua,
#      :description => 'A sample Lua snippet',
#      :tags        => 'lua test',
#      :text        => lua_snippet_text )
#  end
#
#  let( :c_snippet ) do
#    c_snippet_text = <<EOS
##include<stdio.h>
#Int main(void)
#{
#  Int a = 14;
#  Int b = 73;
#  Subtr = 73 - 14;
#    Printf("Tirando %i de %i resulta em %i\\n",a,b,subtr);
#    Return 0;
#}
#EOS
#
#    mock_model( 'Snippet',
#      :name        => 'C snippet',
#      :type        => :c,
#      :description => 'A sample C snippet',
#      :tags        => 'c test',
#      :text        => c_snippet_text )
#  end

  let( :snippet1 ) { mock_model( 'Snippet', :name => 'Snippet 1' )}
  let( :snippet2 ) { mock_model( 'Snippet', :name => 'Snippet 2' )}
  let( :new_snippet ) { mock_model( 'Snippet' ).as_new_record.as_null_object }

  before do
    assign( :recent_snippets, [snippet1, snippet2] )
    assign( :snippet, new_snippet )
    render
  end

  it "renders a div for all content" do
    rendered.should have_selector( 'div#page' )
  end

  it "renders a div for the header" do
    rendered.should have_selector( 'div#header' )
  end

  it "displays a welcome message within the header in an H1 tag" do
    rendered.should have_selector( 'div#header h1' ) do |h1|
      h1.should contain( 'Welcome to Snippets!' )
    end
  end

  it "renders a div for the body" do
    rendered.should have_selector( 'div#body' )
  end

  it "renders a div for the sidebar with links to recent snippets" do
    rendered.should have_selector( 'div#sidebar ul#recent_snippets li a' ) do |link|
      link.should contain lua_snippet.name
      link.should contain c_snippet.name
    end
  end

  it "renders a div for the snippet form" do
    rendered.should have_selector( 'div#snippet' )
  end
  
  it "renders a form to create a new snippet" do
    rendered.should have_selector( 'form', :method => 'post', :action => snippets_path ) do |form|
      form.should have_selector( 'input', :type => 'submit' )
    end
  end

  it "renders a label and text field for the new snippet's name" do
    rendered.should have_selector( 'form' ) do |form|
      form.should have_selector( 'label', :for => 'snippet_name' )
      form.should have_selector( 'input#snippet_name', :type => 'text', :name => 'snippet[name]' )
    end
  end

  it "renders a select field for the new snippet's type" do
    rendered.should have_selector( 'form' ) do |form|
      form.should have_selector( 'select#snippet_type', :name => 'snippet[type]' )
    end
  end

  it "renders a label and text field for the new snippet's description" do
    rendered.should have_selector( 'form' ) do |form|
      form.should have_selector( 'label', :for => 'snippet_description' )
      form.should have_selector( 'input#snippet_description', :type => 'text', :name => 'snippet[description]' )
    end
  end

  it "renders a label and text field for the new snippet's tags" do
    rendered.should have_selector( 'form' ) do |form|
      form.should have_selector( 'label', :for => 'snippet_tags' )
      form.should have_selector( 'input#snippet_tags', :type => 'text', :name => 'snippet[tags]' )
    end
  end

  it "renders a label and textarea for the new snippet's text" do
    rendered.should have_selector( 'form' ) do |form|
      form.should have_selector( 'label', :for => 'snippet_text' )
      form.should have_selector( 'textarea#snippet_text', :name => 'snippet[text]' )
    end
  end
end
