class LessonsController < ApplicationController
  def show
    @lesson = Lesson.includes(:words, :audio_attachment, content: :embeds).find(params[:id])
  end
end
