require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	
	describe "GET #index" do
		it 'show list of all posts' do
		 get :index
     expect(response).to have_http_status(:success)
    end
  end 

  describe "GET #new" do
		it 'when we want to create a new post' do 
		 get :new
     expect(response).to have_http_status(:ok)
    end
  end

	describe "POST #create post" do
		byebug
	  it "create a new post when valid attribute" do
	   @post = Post.create(title: "ror", body: "ruby on rails")
	   @post.save
	   expect(response).to redirect_to(posts_path)
	  end
	  it "create a new post when invalid attribute" do
	   @post = Post.create(title: "", body: "")
	   @post.save 
	   expect(response).to render_template(:new)
	  end 
	end 

  

	describe "PUT #update post" do
	  it "update an existing post" do
	  end
	end

  describe "DELETE #destroy post" do
	  it "delete the post" do
	   @post = Post.create(title: "rails", body: "rails is a web development framework")
	   @post.destroy
	   expect 'delete the post'
	   redirect_to posts_path
    end 
	end
end