require 'byebug'

class FightSimulator
  class << self

    def perform(fight)
      @report = []
      set_winner_and_looser(fight)
      fight.save
      @report

    end

    def set_winner_and_looser(fight)
      @warrior_1 = fight.warriors.first
      @warrior_2 = fight.warriors.second
      weapon_1 = @warrior_1.weapons.first
      weapon_2 = @warrior_2.weapons.first
      @hits_warrior_1 = (@warrior_1.life + weapon_1.life_bonus) / (@warrior_2.attack_point + weapon_2.attack_bonus)
      @hits_warrior_2 = (@warrior_2.life + weapon_2.life_bonus) / (@warrior_1.attack_point + weapon_1.attack_bonus)
      if fight.warriors.count <= 1
        fight.winner = @warrior_1.name
        fight.looser = ""
        msg = "Harakiri " + @warrior_1.name + " ? Non, quand même pas."
        @report << msg
      elsif @hits_warrior_1 > @hits_warrior_2
        fight.winner = @warrior_1.name
        fight.looser = @warrior_2.name
        update_statistics_winner(@warrior_1)
        update_statistics_looser(@warrior_2)
        @report << report_easy(fight.winner, fight.looser, @hits_warrior_2)
      elsif @hits_warrior_1 == @hits_warrior_2
        if @warrior_1.dexterity_points > @warrior_2.dexterity_points
          fight.winner = @warrior_1.name
          fight.looser = @warrior_2.name
          update_statistics_winner(@warrior_1)
          update_statistics_looser(@warrior_2)
          @report << report_hard(fight.winner, fight.looser, @hits_warrior_1)
        end
      else
        fight.looser = @warrior_1.name
        fight.winner = @warrior_2.name
        update_statistics_winner(@warrior_2)
        update_statistics_looser(@warrior_1)
        @report << report_easy(fight.winner, fight.looser, @hits_warrior_1)
      end
    end

    def update_statistics_winner(winner)
      winner.experience += 5
      winner.win += 1
      winner.save
    end

    def update_statistics_looser(looser)
      looser.experience += 1
      looser.lose += 1
      looser.save
    end

    def report_easy(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups !"
    end

    def report_hard(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups ! Mais surtout grâce à sa dextérité !"
    end
  end
end

