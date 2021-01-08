require './lib/game'

describe Game do
    let(:player1) {double("Player 1")}
    let(:player2) {double("Player 2")}
    let(:game) {Game.new(player1,player2)}

    before do
        allow(player1).to receive(:change_hp)
        allow(player2).to receive(:change_hp)
        allow(player1).to receive(:dead?).and_return(false)
        allow(player2).to receive(:dead?).and_return(false)
    end

    it "can decrease p1's health" do
        allow(player1).to receive(:health).and_return(100, 90)
        expect{ game.launch_attack("P2_Attack") }.to change { game.p1.health }.by(-10)
    end

    it "can decrease p2's health" do
        allow(player2).to receive(:health).and_return(100, 90)
        expect{ game.launch_attack("P1_Attack") }.to change { game.p2.health }.by(-10)
    end

    describe "managing health" do
        before do
            allow(player2).to receive(:dead?).and_return(false, false, false, false, false, false, false, false, false, true)
        end

        it "can return a player whose health that == 0" do
            10.times{ game.launch_attack("P1_Attack") }
            expect(game.dead_players).to eq ["Player_2"]
        end

        it "returns both players if it's a draw" do
            allow(player1).to receive(:dead?).and_return(false, false, false, false, false, false, false, false, false, true)
            10.times { |x| game.launch_attack(["P1_Attack","P2_Attack"][x%2]) }
            expect(game.dead_players).to eq ["Player_1", "Player_2"]
        end
    end
    
    describe "turns" do
        it "starts on player 1's turn" do
            expect(game.current_player).to eq player1
        end

        it "can change turns" do
            game.launch_attack("P1_Attack")
            expect(game.current_player).to eq player2
        end
    end
end