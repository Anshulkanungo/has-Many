class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(radio_params)
     @student.save
     redirect_to  new_subject_path(id: @student.id)
  end
 private
 def radio_params
  params.require(:student).permit(:name)
 end
end

