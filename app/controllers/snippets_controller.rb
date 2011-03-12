class SnippetsController < ApplicationController
  def index
  end

  def create
    snippet = Snippet.new(params[:snippet])
    snippet.save
    redirect_to :action => "index"
  end

end
