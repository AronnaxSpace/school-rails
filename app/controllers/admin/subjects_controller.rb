module Admin
  class SubjectsController < BaseController
    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        redirect_to admin_root_path, notice: 'Subject was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @subject = Subject.find(params[:id])
    end

    def update
      @subject = Subject.find(params[:id])

      if @subject.update(subject_params)
        redirect_to admin_root_path, notice: 'Subject was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @subject = Subject.find(params[:id])
      @subject.destroy

      redirect_to admin_root_path, notice: 'Subject was successfully destroyed.'
    end

    private

    def subject_params
      params.require(:subject).permit(:name)
    end
  end
end
