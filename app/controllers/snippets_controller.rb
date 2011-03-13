class SnippetsController < ApplicationController
  def index
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      flash[:notice] = "The snippet was saved successfully."
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

end
