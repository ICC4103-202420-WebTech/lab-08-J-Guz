class TrainingsController < ApplicationController

  before_action :authenticate_user!

  def index
    @trainings = current_user.trainings
  end

  def show
    @training = Training.find params['id']
  end 

  def new
    @training = Training.new
  end

  def create
    training = current_user.trainings.new(training_params)
    if training.save
      redirect_to trainings_path, notice: 'Entrenamiento creado exitosamente.'
    else
      redirect_to new_training_path
    end
  end

  def destroy
    training = Training.find params['id']
    training.destroy
    redirect_to trainings_path
  end

  def edit
    @training = Training.find params['id']
  end

  def update
    training = Training.find params['id']
    if training.update training_params
      redirect_to training_path(training)
    else
      redirect_to trainings_path, alert: "libro no se pudo actualizar"
    end
  end

  private
    def training_params
      params.require(:training).permit(:name, :description, :duration)
    end

end
