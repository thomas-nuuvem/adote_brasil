class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    @animals = @animals.search(params[:search]) if params[:search].present?
    @animals = @animals.by_species(params[:species]) if params[:species].present?
    @animals = @animals.by_size(params[:size]) if params[:size].present?
    @animals = @animals.by_gender(params[:gender]) if params[:gender].present?
    @animals = @animals.order(created_at: :desc)
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animals_path, notice: "Animal anunciado com sucesso!" }
        format.turbo_stream { redirect_to animals_path, notice: "Animal anunciado com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def animal_params
    params.require(:animal).permit(
      :name, :species, :breed, :age, :gender, :size,
      :image, :city, :state, :description,
      :is_vaccinated, :is_neutered,
      :caregiver_name, :caregiver_whatsapp, :caregiver_instagram, :caregiver_facebook
    )
  end
end
