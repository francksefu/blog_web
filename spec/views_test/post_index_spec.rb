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

  let!(:comment11) do
    Comment.create(user:, post: post1, text: 'Hello post 1')
  end

  let!(:comment12) do
    Comment.create(user:, post: post1, text: 'second time')
  end

  let!(:comment21) do
    Comment.create(user:, post: post2, text: 'first time')
  end

  let!(:comment22) do
    Comment.create(user:, post: post2, text: 'second time franck')
  end

  scenario 'See name of users' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'profil of users' do
    visit user_posts_path(user)
    expect(page).to have_content(user.photo)
  end

  scenario 'number of users' do
    visit user_posts_path(user)
    expect(page).to have_content(user.posts_counter.to_s)
  end

  scenario 'post title' do
    visit user_posts_path(user)
    expect(page).to have_content(post1.title)
  end

  scenario 'posts text' do
    visit user_posts_path(user)
    expect(page).to have_content(post1.text)
  end

  scenario 'comments text' do
    visit user_posts_path(user)
    expect(page).to have_content(comment11.text)
  end

  scenario 'comments text' do
    visit user_posts_path(user)
    expect(page).to have_content(comment12.text)
  end

  scenario 'comments text' do
    visit user_posts_path(user)
    expect(page).to have_content(comment21.text)
  end

  scenario 'comments texte' do
    visit user_posts_path(user)
    expect(page).to have_content(comment22.text)
  end

  scenario 'check link' do
    visit user_posts_path(user)
    click_link post1.title
    expect(page).to have_current_path(user_post_path(user, post1))
  end

  scenario 'check link' do
    visit user_posts_path(user)
    click_link post2.title
    expect(page).to have_current_path(user_post_path(user, post2))
  end
end
