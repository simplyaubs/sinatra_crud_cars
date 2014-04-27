require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Managing Cars' do
  scenario 'User can add a new car' do
    visit '/'
    click_on 'Add New Car'
    fill_in 'make', with: 'Jeep'
    fill_in 'model', with: 'Wrangler'
    fill_in 'color', with: 'Blue'
    click_on 'Add New Car'
    expect(page).to have_content 'Jeep'
  end
end