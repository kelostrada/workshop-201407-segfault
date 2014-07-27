require 'rails_helper'

describe 'Sign-in process', type: :feature do

  context 'given user with email and password already exists' do
    it 'signs me in' do
      visit '/sessions/new'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'secretsecret'

      click_button 'Sign in'

      expect(page).to have_content('You are now signed-in')
    end
  end

  context 'given bad email or password' do
    it 'does not sign me in and redirects me to home page' do
      visit '/sessions/new'

      fill_in 'Email', with: 'bad@example.com'
      fill_in 'Password', with: '111'

      click_button 'Sign in'

      expect(current_path).to eq('/sessions/new')
      expect(page).to have_content('Bad user/password')
    end
  end

end