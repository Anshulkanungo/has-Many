class SubjectsController < ApplicationController

  def new
    @subject = Subject.new
    
    @student = Student.find(params[:id])
  end

   def create
    @student = Student.find(params[:subject][:student_id])
    #debugger
    @subject = @student.subjects.build( many_params).save
    redirect_to student_path(@student.id)
  end

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

 

  private
  def many_params
    params.require(:subject).permit(:branch, :student_id)
  end
  end
