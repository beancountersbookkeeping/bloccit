require 'rails_helper'

RSpec.describe PostsController, type: :controller do

let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
       it "assigns [my_post] to @posts" do
       get :index
       expect(assigns(:posts)).to eq([my_post])
     end
  end
#  describe "GET show" do
 #    it "returns http success" do
 #      get :show
 #      expect(response).to have_http_status(:success)
 #    end
 #  end

 # describe "GET new" do
 #   it "returns http success" do
 #     get :new
 #     expect(response).to have_http_status(:success)
 #   end
 # end

   describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_post.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_post.id}
       expect(response).to render_template :edit
     end
 
     it "assigns post to be updated to @post" do
       get :edit, {id: my_post.id}
 
       post_instance = assigns(:post)
 
       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, {id: my_post.id}
       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to posts index" do
       delete :destroy, {id: my_post.id}
       expect(response).to redirect_to posts_path
     end
   end
   
end
