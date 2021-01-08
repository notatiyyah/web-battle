require './lib/game'

describe Game do
    let(:game) {Game.new}

    it "stores hit points" do
        expect(game.p1_health).to eq 100
        expect(game.p2_health).to eq 100
    end

    it "can decrease p2's health" do
        expect{ game.p1_attack }.to change { game.p2_health }.by(-20)
    end

    it "can decrease p1's health" do
        expect{ game.p2_attack }.to change { game.p1_health }.by(-20)
    end

end