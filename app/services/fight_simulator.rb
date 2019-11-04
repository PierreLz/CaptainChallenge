require 'byebug'

class FightSimulator
  class << self

    def perform(fight)
      @report = []
      fight_built = build_with_elements(fight)
      simulate_winner_and_looser(fight_built)
      @report
    end

    def build_with_elements(fight)
      @warrior_1 = Warrior.find(fight.warrior1_id)
      @warrior_2 = Warrior.find(fight.warrior2_id)
      @warrior_1.weapons << Weapon.find(fight.weapon1_id)
      @warrior_2.weapons << Weapon.find(fight.weapon2_id)
      fight.warriors << [ @warrior_1 , @warrior_2 ]
      fight
    end

    def simulate_winner_and_looser(fight)
      set_variables(fight)
      if @warrior_1.name == @warrior_2.name
        fight.winner = @warrior_1.name
        fight.looser = ""
        msg = "Harakiri " + @warrior_1.name + " ? Non, quand même pas."
        @report << msg
      elsif @hits_warrior_1 > @hits_warrior_2
        update_models(@warrior_1, @warrior_2, fight)
        @report << report_easy(fight.winner, fight.looser, @hits_warrior_2)
      elsif @hits_warrior_1 == @hits_warrior_2
        if @warrior_1.dexterity_points > @warrior_2.dexterity_points
          update_models(@warrior_1, @warrior_2, fight)
          @report << report_hard(fight.winner, fight.looser, @hits_warrior_1)
        end
      else
        update_models(@warrior_2, @warrior_1, fight)
        @report << report_easy(fight.winner, fight.looser, @hits_warrior_1)
      end
    end

    def set_variables(fight)
      weapon_1 = @warrior_1.weapons.first
      weapon_2 = @warrior_2.weapons.first
      @hits_warrior_1 = (@warrior_1.life + weapon_1.life_bonus) / (@warrior_2.attack_point + weapon_2.attack_bonus)
      @hits_warrior_2 = (@warrior_2.life + weapon_2.life_bonus) / (@warrior_1.attack_point + weapon_1.attack_bonus)
    end

    def update_models(winner, looser, fight)
      winner.add_experience(5)
      winner.add_win(1)
      winner.save
      looser.add_experience(1)
      looser.add_lose(1)
      looser.save
      fight.winner = winner.name
      fight.looser = looser.name
      fight.save
    end

    def report_easy(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups !"
    end

    def report_hard(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups ! Mais surtout grâce à sa dextérité !"
    end
  end
end

