require 'rails_helper'

RSpec.describe 'User Validation', type: :system do
  describe 'home page' do
    before do
      visit new_user_session_path
      User.create(name: 'mat', email: 'mat@gmail.com', password: '123456')
      sleep(1)
      page.fill_in 'Email', with: 'mat@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '123456'
      sleep(1)
      click_button('Log in')
      sleep(3)
    end
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Public Recipes')
    end
  end
end
