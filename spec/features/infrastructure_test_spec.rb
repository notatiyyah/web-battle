require "capybara/rspec"
require_relative "../../lib/app"
require 'spec_helper'

feature 'Testing infrastructure' do

  scenario 'Allow users to input names' do
    visit('/')
    fill_in "player_1", with: "P1"
    fill_in "player_2", with: "P2"
    click_on 'Submit'
    expect(page).to have_content "P1 P2"
  end
end