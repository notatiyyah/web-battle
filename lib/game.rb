class Game
    attr_reader :p1_health, :p2_health
    @@BASE_HEALTH = 100

    def initialize
      @p1_health = @@BASE_HEALTH
      @p2_health = @@BASE_HEALTH
    end

    def p1_attack
      @p2_health -= 20
    end

    def p2_attack
      @p1_health -= 20
    end
end