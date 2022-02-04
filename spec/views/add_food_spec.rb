require 'rails_helper'

RSpec.describe 'add food view', type: :system do
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
        click_button('Add food')
        expect(page).to have_content('Name')
        expect(page).to have_content('Measurement unit')
        expect(page).to have_content('Price')
      end
      it 'add food correctly' do
        visit foods_path
        sleep(3)
        click_button('Add food')
        page.fill_in 'Name', with: 'coconut'
        page.fill_in 'Measurement unit', with: 'unit'
        page.fill_in 'Price', with: '5'
        click_button('Save Food')
        sleep(2)
        expect(page).to have_content('coconut')
      end
  end
end