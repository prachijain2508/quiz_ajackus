class Admin::QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build.options.build
    4.times { @quiz.questions.build.options.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to admin_quizzes_path, notice: "Quiz created successfully."
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(
      :title,
      questions_attributes: [
        :id, :content, :question_type, :correct_answer, :_destroy,
        options_attributes: [:id, :content, :correct, :_destroy]
      ]
    )
  end
end
