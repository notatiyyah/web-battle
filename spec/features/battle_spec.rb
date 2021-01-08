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
    
    scenario "player 1 hits player 2 & p2 health = -20" do
        sign_in_and_play
        click_on 'P1_Attack'
        expect(page).to have_content "100 : 80"
    end

end
