require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Managing Cars' do
  scenario 'User can see and add a new car' do
    visit '/'
    click_on 'Add New Car'
    fill_in 'make', with: 'Jeep'
    fill_in 'model', with: 'Wrangler'
    fill_in 'color', with: 'Blue'
    click_on 'Add New Car'
    expect(page).to have_content 'Jeep'
  end

  scenario 'user can update a car' do
    visit '/cars/new'
    fill_in 'make', with: 'Jeep'
    fill_in 'model', with: 'Wrangler'
    fill_in 'color', with: 'Blue'
    click_on 'Add New Car'
    click_on 'Jeep'
    fill_in 'make', with: 'Toyota'
    click_on 'Update Car'
    expect(page).to_not have_content 'Jeep'
    expect(page).to have_content 'Toyota'
  end

  scenario 'user can destroy a car' do
    visit '/cars/new'
    fill_in 'make', with: 'Jeep'
    fill_in 'model', with: 'Wrangler'
    fill_in 'color', with: 'Blue'
    click_on 'Add New Car'
    click_on 'Jeep'
    click_on 'Destroy Car'
    expect(page).to_not have_content('Jeep')
  end
end