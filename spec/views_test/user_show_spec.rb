require 'rails_helper'
RSpec.describe 'Users/views', type: :feature do
  let!(:user) do
    User.create(name: 'Ryan', photo: 'photo', bio: 'bio', posts_counter: 1)
  end
  let!(:post1) do
    Post.create(author: user, title: 'The man of the year', text: 'Kalunga sef', comments_counter: 1, likes_counter: 1)
  end
  let!(:post2) do
    Post.create(author: user, title: 'Gentlemen', text: 'Blaise et Emma', comments_counter: 1, likes_counter: 1)
  end
  let!(:post3) do
    Post.create(author: user, title: 'Her wife', text: 'Junior et Apo', comments_counter: 1, likes_counter: 1)
  end
  let!(:post4) do
    Post.create(author: user, title: 'His live', text: 'Pierrette', comments_counter: 1, likes_counter: 1)
  end
  scenario 'show_page See name of users' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end
  scenario 'show_page See name of users' do
    visit user_path(user)
    expect(page).to have_content(user.post)
  end
  scenario 'show_page profil of users' do
    visit user_path(user)
    expect(page).to have_content(user.photo)
  end
  scenario 'show_page bio of users' do
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end
  scenario 'show_page 3 recent post of users' do
    visit user_path(user)
    expect(page).to have_content(post4.text)
    expect(page).to have_content(post3.text)
    expect(page).to have_content(post2.text)
  end
  scenario 'show_page post of users' do
    visit user_path(user)
    expect(page).to have_content('See all post')
  end
  scenario 'When I click to see all posts, it redirects me to the user s post s index page.' do
    visit user_path(user)
      click_link "See all post"
      expect(page).to have_current_path(user_posts_path(user))
  end
  scenario 'When I click a user s post, it redirects me to that post s show page' do
    visit user_path(user)
      click_link post3.text
      expect(page).to have_current_path(user_post_path(user, post3))
  end
end