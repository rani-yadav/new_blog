
require 'spec_helper'

describe 'posts/new.html.erb' do
	it 'displays post details correctly' do
		assign(:post, @post = Post.new)  
		render
		expect(rendered).to match(/text/)
	end
end