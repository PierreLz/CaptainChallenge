require 'byebug'

class FightsController < ApplicationController

  def create
    @fight = Fight.new(fight_params)
    if @fight.valid?
      warrior1 = Warrior.find(@fight.warrior1_id)
      warrior2 = Warrior.find(@fight.warrior2_id)
      warrior1.weapons << Weapon.find(@fight.weapon1_id)
      warrior2.weapons << Weapon.find(@fight.weapon2_id)
      @fight.warriors << [ warrior1 , warrior2 ]
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
