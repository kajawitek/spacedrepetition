# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index, locals: { subjects: Subject.all }
  end

  def new
    render :new, locals: { subject: Subject.new }
  end

  def create
    subject = Subject.new(subject_params)
    subject.user = current_user
    if subject.save
      redirect_to subjects_path, notice: 'Subject was successfully created.'
    else
      render :new, locals: { subject: subject }, status: :unprocessable_entity
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:title, :description)
  end
end
