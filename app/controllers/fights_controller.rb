require 'byebug'

class FightsController < ApplicationController

  def create
    @fight = Fight.new(fight_params)
    if @fight.valid?
      @report = FightSimulator.perform(@fight)
      redirect_to controller: 'warriors', action: 'index', report: @report
      flash[:notice] = "Le combat à eu lieu ! Regardez les résultats !"
    else
      redirect_to root_path
      flash[:alert] = @fight.errors
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:warrior1_id, :warrior2_id, :weapon1_id, :weapon2_id)
  end
end
