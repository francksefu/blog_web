require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(author: User.first, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater or equal to 0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be greater or equal to 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'title length must not be greater than 250' do
    subject.title = 'b' * 300
    expect(subject).to_not be_valid
  end
end
