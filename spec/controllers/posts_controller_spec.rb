require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "GET #index" do
    it 'show list of all posts' do
     get :index
     expect(response).to render_template("index")
    end
  end 

  describe "GET #new" do
    it 'when we want to create a new post' do 
     get :new
     expect(response).to render_template("new")
    end
  end

   describe "POST #create post" do
    it "create a new post when valid attribute" do
     @post = Post.create(title: "ror", body: "ruby on rails")
     @post.save
     expect(response).to redirect_to(posts_path)
    end
    it "create a new post when invalid attribute" do
     @post = Post.create(title: "", body: "")
     @post.save 
     expect(response).to raise_error("invalid attributes")
    end 
  end 

  describe "GET #show" do
    it "responds to GET" do
      get :show, id: :@post.id 
      expect(response).to redirect_to(post_path)
    end
  end

  describe "DELETE #destroy post" do 
    it "deletes the post" do
      expect{ 
        delete :destroy, id: :@post, post: {title: "@post.title", body: "@post.body"}
     }.to change(Post, :count).by(-1)
    end 

    it "successfull destroyed the post"do
    expect(response).to redirect_to(posts_path)
  	end	
	end
end