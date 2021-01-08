class Player
    attr_reader :name, :health
    @@BASE_HP = 100

    def initialize(name)
        @name = name
        @health = @@BASE_HP
    end

    def change_hp(num)
        @health += num
    end

end