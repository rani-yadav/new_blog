require 'spec_helper'

describe 'posts/show.html.erb' do
  it 'displays post details correctly' do
  	byebug
    assign(:post, @post = Post.create(title: 'ror', body: 'ruby on rails'))

    render :template => "posts/show.html.erb"
    expect(rendered).to match /ror/
  end
end