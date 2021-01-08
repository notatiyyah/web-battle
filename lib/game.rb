class Game
    attr_reader :p1, :p2

    def initialize(p1,p2)
      @p1 = p1
      @p2 = p2
    end

    def launch_attack(player)
      player == "P1_Attack" ? p2_take_damage : p1_take_damage
    end

    private

    def p1_take_damage
      @p1.change_hp(-10)
    end

    def p2_take_damage
      @p2.change_hp(-10)
    end

end