# # require 'rails_helper'

# # RSpec.describe 'Categories management', type: :feature do
# #   # Before each test, create a user using FactoryBot and log in
# #   before(:each) do
# #     user = FactoryBot.create(:user, email: 'lelou@gmail.com', password: 'ABC123')
# #     visit new_user_session_path

# #     fill_in 'user_email', with: user.email
# #     fill_in 'user_password', with: 'ABC123'
# #     click_button 'Log in'
# #   end

# #   it 'allows a user to add a category' do
# #     visit new_category_path

# #     # fill_in 'category[name]', with: 'Apple Pie' # Use the field name 'Name'
# #     # fill_in 'category[icon]', with: 'icon'       # Use the field name 'Icon'
# #     fill_in 'name', with: 'Apple Pie'
# #     fill_in 'icon', with: 'icon'
# #     # click_button 'Save'
# #     # click_button 'Add new Category'


# #     expect(page).to have_text('Successfully added your category!')
# #   end

# #   it 'allows a user to view category transactions' do
# #     # Create a category using FactoryBot
# #     category = FactoryBot.create(:category, name: 'Apple Pie', icon: 'icon', user: User.last)

# #     # Visit the category's transactions page
# #     visit category_purchases_path(category)

# #     # Expect that you are on the category's transactions page
# #     expect(page).to have_text('Category Transactions: Apple Pie')
# #   end
# # end


# require 'rails_helper'

# RSpec.describe 'CategoriesController#index', type: :feature do
#   before(:each) do
#     @user = FactoryBot.create(:user)  # Use FactoryBot to create a user

#     # Use FactoryBot to create categories and associate them with the user
#     @categories = [
#       FactoryBot.create(:category, user: @user, name: 'Transport', icon: 'https://unsplash.com/photos/igX2deuD9lc'),
#       FactoryBot.create(:category, user: @user, name: 'Breakfast', icon: 'https://unsplash.com/photos/igX2deuD9lc')
#     ]

#     login_as(@user, scope: :user)  # Use Devise's login_as method

#     visit categories_path
#   end

#   describe 'Index page' do
#     it 'should be able to view the name of categories' do
#       @categories.each do |category|
#         expect(page).to have_content(category.name)
#       end
#     end

#     it 'clicking on the "Add new Category" button redirects to the new category form' do
#       click_link 'Add new Category'
#       expect(page).to have_current_path(new_category_path)
#     end
#   end
# end

require 'rails_helper'


RSpec.describe 'Recipe management', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    user = FactoryBot.create(:user, name: 'John Doe')
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create a category' do
    visit new_category_path
    fill_in 'category[name]', with: 'Apple Pie'
    fill_in 'category[icon]', with: 'https://media.licdn.com/dms/image/D4D35AQHcAKVJchre-Q/profile-framedphoto-shrink_200_200/0/1690870818730?e=1698973200&v=beta&t=gDHPAjC-Jc_A76RBcbz5HPUdw_w06248YcJvskiT2pY'

    within('form') do
      click_button 'Save'
    end

    sleep(2)
    expect(page).to have_text('Apple Pie')
  end
end
