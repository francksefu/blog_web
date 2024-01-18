require 'rails_helper'

describe ' Controller /posts' do
  let!(:user) do
    User.create(name: 'franck', photo: 'photo', bio: 'bio', posts_counter: 1)
  end

  let!(:post) do
    Post.create(author: user, title: 'Franck', text: 'Grace et Emma', comments_counter: 1, likes_counter: 1)
  end

  it 'get index for post' do
    get "/users/#{user.id}/posts"
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'posts/index'
  end

  it 'get show for post' do
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'posts/show'
  end
end
