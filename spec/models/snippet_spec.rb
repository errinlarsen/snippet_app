require 'spec_helper'

describe Snippet do
  lua_text = <<EOS
local position = {x=100, y=100, z=7}

function onUse(cid, item, fromPosition)
  doSendMagicEffect(fromPosition, 12)
  doTeleportThing(cid, position)
  doSendMagicEffect(position, 12)
  return true
end
EOS

  before :each do
    @snippet = Snippet.new(
      :name => 'Lua snippet',
      :text => lua_text,
      :tags => 'Lua function',
      :type => 'Lua')
  end

  it "is valid with valid attributes" do
    @snippet.should be_valid
  end

  it "is not valid without a name" do
    @snippet.name = nil
    @snippet.should_not be_valid
  end

  it "is not valid without a tag" do
    @snippet.tags = nil
    @snippet.should_not be_valid
  end

  it "is not valid without a type" do
    @snippet.type = nil
    @snippet.should_not be_valid
  end

  it "is not valid without text" do
    @snippet.text = nil
    @snippet.should_not be_valid
  end

end
