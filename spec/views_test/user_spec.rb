require 'rails_helper'
RSpec.describe 'Users/views', type: :feature do
  let!(:user1) do
    User.create(name: 'franck', photo: 'photo', bio: 'bio', posts_counter: 1)
  end
  let!(:user) do
    User.create(name: 'Ryan', photo: 'photo', bio: 'bio', posts_counter: 1)
  end
  scenario 'index_page See name of users' do
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user.name)
  end
  scenario 'index_page profil of users' do
    visit users_path
    expect(page).to have_content(user1.photo)
    expect(page).to have_content(user.photo)
  end
  scenario 'index_page number of users' do
    visit users_path
    expect(page).to have_content(user1.posts_counter)
    expect(page).to have_content(user.posts_counter)
  end
  scenario 'index_page redirection to show page' do
    visit users_path
      click_link user.name
      expect(page).to have_current_path(user_path(user))
  end
  scenario 'index_page redirection to show page' do
    visit users_path
      click_link user1.name
      expect(page).to have_current_path(user_path(user1))
  end
end