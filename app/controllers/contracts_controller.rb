class ContractsController < ApplicationController
  before_action :set_contract_and_pet, only: [:edit, :update, :destroy]

  def create
    @contract = Contract.new(contract_params)
    @contract.pet = Pet.find(params[:pet_id])
    @contract.user = current_user
    if @contract.save
      redirect_to pet_path(@contract.pet)
    else
      redirect_to pet_path(@contract.pet)
    end
    authorize @contract
  end

  def edit
    authorize @contract
  end

  def update
    if @contract.update(contract_params)
      redirect_to pet_path(@contract.pet)
    else
      render :edit
    end
    authorize @contract
  end

  def destroy
    @contract.destroy
    redirect_to pet_path(@pet)
    authorize @contract
  end

  private

  def price(pet)
    length = self.start_date - self.end_date
    return pet.price * length
  end

  def set_contract_and_pet
    @pet    = Pet.find(params[:pet_id])
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:start_date, :end_date)
  end
end
