require 'spec_helper'

describe SnippetsController do

  let(:snippet) { mock_model(Snippet).as_null_object }
  let(:snippet_params) {
    { "name" => "A snippet",
    "type" => "1",
    "description" => "A snippet's description",
    "tags" => "Test Tag",
    "text" => "a quick brown fox" }
  }

  before do
    Snippet.stub(:new).and_return(snippet)
  end
  

  describe "POST 'create'" do
    it "creates a new snippet" do
      Snippet.should_receive(:new).with(snippet_params).and_return(snippet)
      post :create, :snippet => snippet_params
    end      

    it "saves the snippet" do
      snippet.should_receive(:save)
      post :create
    end
    
    it "redirects to the Snippets index" do
      post :create
      response.should redirect_to(:action => "index")
    end
  end

end
