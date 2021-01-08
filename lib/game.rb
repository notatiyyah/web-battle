class Game
    attr_reader :p1_health, :p2_health, :p1_name, :p2_name
    @@BASE_HEALTH = 100

    def initialize(p1,p2)
      @p1_name = p1
      @p2_name = p2
      @p1_health = @@BASE_HEALTH
      @p2_health = @@BASE_HEALTH
    end

    def p1_take_damage
      @p1_health -= 10
    end

    def p2_take_damage
      @p2_health -= 10
    end

end