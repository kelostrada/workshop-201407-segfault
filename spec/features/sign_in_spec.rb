require 'rails_helper'

describe 'Sign-in process', type: :feature do

  context 'given user with email and password already exists' do
    before { User.create(email: 'user@example.com', name: 'User', password: 'secretsecret') }

    it 'signs me in' do
      visit '/users/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'secretsecret'

      click_button 'Sign in'

      expect(page).to have_content('Signed in successfully')
    end
  end

  context 'given bad email or password' do
    it 'does not sign me in and redirects me to home page' do
      visit '/users/sign_in'

      fill_in 'Email', with: 'bad@example.com'
      fill_in 'Password', with: '111'

      click_button 'Sign in'

      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('Invalid email or password.')
    end
  end

end