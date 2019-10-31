require 'byebug'

class FightSimulator
  class << self

    def perform(fight)
      @report = []
      @w1 = fight.warriors.first
      @w2 = fight.warriors.second
      wp1 = @w1.weapons.first
      wp2 = @w2.weapons.first
      q1 = (@w1.life + wp1.life_bonus) / (@w2.attack_point + wp2.attack_bonus)
      @q2 = (@w2.life + wp2.life_bonus) / (@w1.attack_point + wp1.attack_bonus)
      d1 = @w1.dexterity_points
      d2 = @w2.dexterity_points
      if @w1.name == @w2.name
        msg = "Harakiri " + @w1.name + " ? Non, quand même pas."
        fight.winner = @w1.name
        @report << msg
      elsif q1 > @q2
        fight.winner = @w1.name
        fight.looser = @w2.name
        @w1.experience += 5
        @w1.win += 1
        @w2.experience += 1
        @w2.lose += 1
        msg = report_easy(fight.winner, fight.looser, @q2)
        @report << msg
      elsif q1 == @q2
        if d1 > d2
          fight.winner = @w1.name
          fight.looser = @w2.name
          @w1.experience += 5
          @w1.win += 1
          @w2.experience += 1
          @w2.lose += 1
          msg = report_hard(fight.winner, fight.looser, @q2)
          @report << msg
        end
      else
        fight.looser = @w1.name
        fight.winner = @w2.name
        @w2.experience += 5
        @w2.win += 1
        @w1.experience += 1
        @w1.lose += 1
        msg = report_easy(fight.winner, fight.looser, @q2)
        @report << msg
      end
      @w1.save
      @w2.save
      fight.save
      @report
    end

    def report_easy(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups !"
    end

    def report_hard(winner_name, looser_name, hits)
      "Le winner est " + winner_name + " qui a battu " + looser_name + " en " + hits.to_s + " coups ! Mais surtout grâce à sa dextérité !"
    end
  end
end
