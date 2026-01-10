module Admin
  class DashboardController < BaseController
    def index
      @subjects_count = Subject.count
      @chapters_count = Chapter.count
      @lessons_count = Lesson.count
      @words_count = Word.count

      @subjects = Subject.includes(:chapters).all
    end
  end
end
