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

  describe "#create" do
  	byebug
    @post = Post.create(title: "ror", body: "ruby on rails") 
    @post.save
    it "redirect_to @post" do
      expect(:post).to redirect_to(post_url(assigns(:post)))
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
     expect(response).to have content("invalid attributes")
    end 
  end 

  describe "GET #show" do
    it "responds to GET" do
      get :show, :@post.id => "postid"
      expect(response).to redirect_to(post_path)
    end
  end

  describe "DELETE #destroy post" do
    it "delete the post" do
     @post = Post.create(title: "rails", body: "rails is a web development framework")
     @post.destroy
     expect(response).to redirect_to(posts_path)
    end 
  end	
end