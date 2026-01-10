module Admin
  class LessonsController < BaseController
    def show
      @lesson = Lesson.includes(:words).find(params[:id])
    end

    def new
      @chapter = Chapter.find(params[:chapter_id])
      @lesson = @chapter.lessons.build
    end

    def create
      @chapter = Chapter.find(params[:chapter_id])
      @lesson = @chapter.lessons.build(lesson_params)

      if @lesson.save
        redirect_to admin_root_path, notice: "Lesson was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @lesson = Lesson.find(params[:id])
    end

    def update
      @lesson = Lesson.find(params[:id])

      if @lesson.update(lesson_params)
        redirect_to admin_root_path, notice: "Lesson was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @lesson = Lesson.find(params[:id])
      @lesson.destroy

      redirect_to admin_root_path, notice: "Lesson was successfully destroyed."
    end

    private

    def lesson_params
      params.require(:lesson).permit(:name, :position, :content, :audio)
    end
  end
end
