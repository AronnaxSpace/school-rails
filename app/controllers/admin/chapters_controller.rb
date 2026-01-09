module Admin
  class ChaptersController < BaseController
    def create
      @subject = Subject.find(params[:subject_id])
      @chapter = @subject.chapters.build(chapter_params)

      if @chapter.save
        redirect_to subject_path(@subject), notice: 'Chapter was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @chapter = Chapter.find(params[:id])

      if @chapter.update(chapter_params)
        redirect_to subject_path(@chapter.subject), notice: 'Chapter was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @chapter = Chapter.find(params[:id])
      subject = @chapter.subject
      @chapter.destroy

      redirect_to subject_path(subject), notice: 'Chapter was successfully destroyed.'
    end

    private

    def chapter_params
      params.require(:chapter).permit(:name, :position)
    end
  end
end
