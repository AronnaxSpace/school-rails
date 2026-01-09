class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.includes(:lessons).find(params[:id])
  end
end
