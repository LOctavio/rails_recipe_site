require 'rails_helper'

RSpec.describe 'recipe list view', type: :system do
    describe 'recipes list page' do
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
      it 'shows the add recipe button' do
        visit recipes_path
        expect(page).to have_selector(:link_or_button, 'Add new recipe')
        click_button('Add new recipe')
      end
      it 'shows the add recipe button' do
        visit new_recipe_path
        sleep(5)
        expect(page).to have_content('Name')
        expect(page).to have_selector(:link_or_button, 'Create')
      end
    end
end