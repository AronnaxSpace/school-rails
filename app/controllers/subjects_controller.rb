class SubjectsController < ApplicationController
  def index
    @subjects = Subject.includes(:chapters).all
  end

  def show
    @subject = Subject.includes(chapters: :lessons).find(params[:id])
  end
end
