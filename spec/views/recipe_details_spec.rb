require 'rails_helper'

RSpec.describe 'recipe list view', type: :system do
  describe 'recipes list page' do
    before do
      visit new_user_session_path
      User.create(name: 'mat', email: 'mat@gmail.com', password: '123456')
      Recipe.create(name: 'cookies', preparation_time: '20min', cooking_time: '10min', description: 'yummy',
                    public: true, user_id: 1)
      sleep(1)
      page.fill_in 'Email', with: 'mat@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '123456'
      sleep(1)
      click_button('Log in')
      sleep(3)
    end
    it 'shows the add ingredient and generate shopping list button' do
      visit recipe_path(id: 1)
      sleep(5)
      expect(page).to have_content('cookies')
      expect(page).to have_selector(:link_or_button, 'generate shopping list')
      expect(page).to have_selector(:link_or_button, 'Add ingredient')
    end
  end
end
