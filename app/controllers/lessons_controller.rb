class LessonsController < ApplicationController
  def show
    @lesson = Lesson.with_rich_text_content_and_embeds
                    .includes(:words, :audio_attachment)
                    .find(params[:id])
  end
end
