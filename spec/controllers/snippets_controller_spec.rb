require 'spec_helper'

describe SnippetsController do
  let(:snippet) { mock_model(Snippet).as_null_object }

  before do
    Snippet.stub(:new).and_return(snippet)
  end
  

  describe "POST 'create'" do
    it "creates a new snippet" do
      Snippet.should_receive(:new).with("param" => "Some snippet params").and_return(snippet)
      post :create, :snippet => { "param" => "Some snippet params" }
    end      
    

    context "when the snippet saves successfully" do
      before do
        snippet.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The snippet was saved successfully.")
      end

      it "redirects to the Snippets index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end


    context "when the snippet fails to save" do
      before :each do
        snippet.stub(:save).and_return(false)
      end

      it "assigns @snippet" do
        post :create
        assigns[:snippet].should eq(snippet)
      end

      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end

  end
end
