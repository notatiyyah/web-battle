require "capybara/rspec"
require "./lib/app"
require 'spec_helper'
require_relative 'web_helpers.rb'

feature "Start game" do
    
    scenario 'Allow users to input names' do
        sign_in_and_play
        expect(page).to have_content "P1 : P2"
    end

    scenario "show player hit points" do
        sign_in_and_play
        expect(page).to have_content "100 : 100"
    end

end

feature "hit player" do
    
    scenario "player 1 hits player 2 & p2 health = -10" do
        sign_in_and_play
        click_on 'P1_Attack'
        expect(page).to have_content "100 : 90"
    end

    scenario "player 2 hits player 1 & p2 health = -10" do
        sign_in_and_play
        click_on 'P2_Attack'
        expect(page).to have_content "90 : 100"
    end

end
