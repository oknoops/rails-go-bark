class ContractsController < ApplicationController
  def create
    @contract = Contract.new(contract_params)
    @contract.pet = Pet.find(params[:pet_id])
    @contract.user = current_user
    if @contract.save
      redirect_to pet_path(@contract.pet)
    else
      render :new
    end
  end

  def contract_params
    params.require(:contract).permit(:date)
  end
end
