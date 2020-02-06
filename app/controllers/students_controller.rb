class StudentsController < ApplicationController

  def index
    @students = Student.search(params[:query])
  end # @student is the searched paramater.
# index.html.erb contains a partial which houses the @student in a local variable.

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
