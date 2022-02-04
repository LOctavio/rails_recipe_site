require 'rails_helper'

RSpec.describe 'User Validation', type: :system do
  describe 'foods page' do
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
        visit foods_path
        sleep(3)
        expect(page).to have_content('Add food')
        expect(page).to have_content('measurement unit')
        expect(page).to have_content('food')
      end
  end
end