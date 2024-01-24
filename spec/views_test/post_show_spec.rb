require 'rails_helper'

RSpec.describe 'Users/views', type: :feature do

  let!(:user) do
    User.create(name: 'Ryan', photo: 'photo', bio: 'bio', posts_counter: 1)
  end

  let!(:post1) do
    Post.create(author: user, title: 'The man of the year', text: 'Kalunga sef', comments_counter: 1, likes_counter: 1)
  end


  let!(:comment11) do
    Comment.create(user: user, post: post1, text: 'Hello post 1')
  end

  let!(:comment12) do
    Comment.create(user: user, post: post1, text: 'second time')
  end


  scenario 'I can see the post s title' do
    visit user_post_path(user, post1)
      expect(page).to have_content(post1.title)
  end

  scenario 'text for post' do
    visit user_post_path(user, post1)
      expect(page).to have_content(post1.text)
  end

  scenario 'comments text' do
    visit user_post_path(user, post1)
      expect(page).to have_content(comment11.text)
  end

  scenario 'comments text' do
    visit user_post_path(user, post1)
      expect(page).to have_content(comment12.text)
  end

  scenario 'number of likes' do
    visit user_post_path(user, post1)
    expect(page).to have_content(post1.likes_counter.to_s)
  end

  scenario 'number of comment' do
    visit user_post_path(user, post1)
    expect(page).to have_content(post1.comments_counter.to_s)
  end

end