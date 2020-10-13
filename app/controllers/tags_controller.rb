class TagsController < ApplicationController
  def search
    @tweets = Tag.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
