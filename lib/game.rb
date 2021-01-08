class Game
    attr_reader :p1, :p2, :dead_players, :current_player

    def initialize(p1,p2)
      @p1 = p1
      @p2 = p2
      @dead_players = []
      @current_player = @p1
    end

    def launch_attack(player)
      player == "P1_Attack" ? p1_take_turn : p2_take_turn
      check_if_any_dead
    end

    private

    def p1_take_turn
      @p2.change_hp(-10)
      @current_player = @p2
    end

    def p2_take_turn
      @p1.change_hp(-10)
      @current_player = @p1
    end

    def check_if_any_dead
      @dead_players << "Player_1" if @p1.dead?
      @dead_players << "Player_2" if @p2.dead?
    end

end