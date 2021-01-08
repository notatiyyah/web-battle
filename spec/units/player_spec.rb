require './lib/player'

describe Player do
    let(:player) {Player.new("Player")}

    it "takes player name as initialize paramater" do
        expect(player.name).to eq "Player"
    end

    it "is not dead when initialized" do
        expect(player).not_to be_dead
    end

    describe "handles HP" do

        it "sets HP to 100 (default value) when initialised" do
            expect(player.health).to eq 100
        end

        it "decreases HP by 10" do
            expect{ player.change_hp(-10) }.to change { player.health }.by(-10)
        end

    end

    it "is dead when HP = 0 " do
        player.change_hp(-100)
        expect(player).to be_dead
    end

end