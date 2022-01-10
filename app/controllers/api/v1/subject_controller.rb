# Контроллер учебных предметов
class SubjectController < ApplicationController

  # метод получения всех записей учебных предметов из базы данных
  def index
    subjects = Subject.all
    render json: subjects
  end

  # метод создания записи нового учебного предмета
  def create 
    subject = Subject.new(subject_param)
    if subject.save
      render json: subject
    else
      render json: subject.errors
    end 
  end

  # метод обновления записи об учебном предмете
  def update
    subject = Subject.find(params[:subject][:id])
    if subject.update(subject_param)
      render json: subject
    else
      render json: subject.errors
    end
  end

  def destroy
    key = DestroySubject.call(params[:subject][:id])
    if key
      render json: 'deleted successfully'
    else
      render json: 'not found subject'
    end
  end

private

  def subject_param
    params.require(:subject).permit(:name)
  end
end
