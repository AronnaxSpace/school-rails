module Admin
  class WordsController < BaseController
    def create
      @lesson = Lesson.find(params[:lesson_id])
      @word = @lesson.words.build(word_params)

      if @word.save
        redirect_to lesson_path(@lesson), notice: 'Word was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @word = Word.find(params[:id])

      if @word.update(word_params)
        redirect_to lesson_path(@word.lesson), notice: 'Word was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @word = Word.find(params[:id])
      lesson = @word.lesson
      @word.destroy

      redirect_to lesson_path(lesson), notice: 'Word was successfully destroyed.'
    end

    private

    def word_params
      params.require(:word).permit(:text, :translation, :position, :audio)
    end
  end
end
