require 'rails_helper'

describe ' Controller /users' do
  let!(:user) do
    User.create(name: 'franck', photo: 'photo', bio: 'bio', posts_counter: 1)
  end

  it 'get index' do
    get '/users'
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'users/index'
  end

  it 'get show' do
    get "/users/#{user.id}"
    expect(response.status).to eq(200)
    expect(response.body).not_to eq nil
    expect(response).to render_template 'users/show'
  end
end
