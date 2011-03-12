require 'spec_helper'

describe SnippetController do

  describe "POST 'create'" do
    it 'creates a new snippet' do
      Snippet.should_receive(:new).with("text" => "a quick brown fox")
      post :create, :snippets => { "text" => "a quick brown fox" }
    end      
    it 'saves the snippet'
  end

end
