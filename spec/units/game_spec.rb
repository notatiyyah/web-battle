require './lib/game'

describe Game do
    let(:player) {double("Player 1")}
    let(:game) {Game.new(player,player)}

    before do
        allow(player).to receive(:change_hp)
        allow(player).to receive(:health).and_return(100, 90)
    end

    it "can decrease p1's health" do
        expect{ game.launch_attack("Player_2") }.to change { game.p1.health }.by(-10)
    end

    it "can decrease p2's health" do
        expect{ game.launch_attack("Player_2") }.to change { game.p2.health }.by(-10)
    end

end