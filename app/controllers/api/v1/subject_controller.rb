# Контроллер учебных предметов
class Api::V1::SubjectController < ApplicationController

  # метод получения всех записей учебных предметов из базы данных 
  # GET subjects
  def index
    subjects = Subject.all
    render json: subjects
  end

  # метод создания записи нового учебного предмета
  # POST subjects
  def create
    subject = Subject.new(subject_param)
    if subject.save
      render json: subject
    else
      subject.errors
      render json: subject.errors
    end 
  end

  # метод обновления записи об учебном предмете
  # PATCH subject
  def update
    subject = Subject.find(params[:id])
    if subject.update(subject_param)
      render json: subject
    else
      render json: subject.errors
    end
  end

  # Удаление учебного предмета из списка
  # DELETE subject
  def destroy
    if DestroySubject.call(params[:id])
      render json: 'Предмет успешно удален!'
    else
      render json: 'Ошибка удаления!'
    end
  end

private

  def subject_param
    params.require(:subject).permit(:name)
  end
end
