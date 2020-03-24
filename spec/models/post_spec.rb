require 'rails_helper'

RSpec.describe Post, type: :model do

 context'vlaidation tests' do

 	it 'ensure title is presence' do
 		post = Post.new(body: 'ruby on rails').save 
 		expect(post).to eq(false)
 	end 

 	it 'ensure body is presence' do
 		post = Post.new(title: 'ruby').save
 		expect(post).to eq(false)
 	end 

 	it 'should save successfully' do
 		post = Post.new(title: 'ruby', body: 'ruby on rails').save
 		expect(post). to eq(true)
 	end 
 	
 end
end
