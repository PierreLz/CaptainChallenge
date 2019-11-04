class WarriorsController < ApplicationController
  before_action :set_warrior, only: [:edit, :update, :destroy]

  def index
    @warrior = Warrior.new
    @warriors = Warrior.all
    @fight = Fight.new
    @report = params[:report]
    @fights = Fight.last(5)
    @weapons = Weapon.all
  end

  def edit
    set_warrior
  end

  def create
    @warrior = Warrior.new(warrior_params)
    attributes_to_i(@warrior)
    if @warrior.save
      redirect_to root_path
      flash[:notice] = success_c_msg
    else
      redirect_to root_path
      flash[:alert] = @warrior.errors
    end
  end

  def update
    set_warrior
    attributes = warrior_params.clone
    if set_warrior.update_attributes(attributes)
      redirect_to root_path
      flash[:notice] = success_u_msg
    else
      render 'edit'
    end
  end

  def destroy
    set_warrior.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
    end
    flash[:notice] = success_d_msg
  end

  private

  def warrior_params
    params.require(:warrior).permit(:name, :life, :attack_point, :dexterity_points, :picture)
  end

  def set_warrior
    @warrior = Warrior.find(params[:id])
  end

  def success_d_msg
    "Votre combattant a été supprimé !"
  end

  def success_u_msg
    "Votre combattant a été mis à jour"
  end

  def success_c_msg
    "Votre combattant a été créé !"
  end

  def attributes_to_i(warrior)
    warrior.life = warrior.life.to_i
    warrior.attack_point = warrior.attack_point.to_i
    warrior.dexterity_points = warrior.dexterity_points.to_i
  end
end
