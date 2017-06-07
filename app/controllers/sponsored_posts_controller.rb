class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = Sponsored_Post.all 
  end

  def new
    @sponsored_post = Sponsored_Post.find(params[:id])
  end

  def edit
     @sponsored_post = Sponsored_Post.find(params[:id])
  end

  def create
     @sponsored_post = Sponsored_Post.new
     @sponsored_post.name = params[:sponsored_post][:name]
     @sponsored_post.description = params[:sponsored_post][:description]
     @sponsored_post.public = params[:sponsored_post][:public]
 
     if @sponsored_post.save
       redirect_to @sponsored_post, notice: "Sponsored Post was saved successfully."
     else
       flash.now[:alert] = "Error creating Sponsored Post. Please try again."
       render :new
     end
  end
   
   def update
     @sponsored_post = Sponsored_Post.find(params[:id])
 
     @sponsored_post.name = params[:sponsored_post][:name]
     @sponsored_post.description = params[:sponsored_post][:description]
     @sponsored_post.public = params[:sponsored_post][:public]
 
     if @sponsored_post.save
        flash[:notice] = "Sponsored Post was updated."
       redirect_to @sponsored_post
     else
       flash.now[:alert] = "Error saving Sponsored Post. Please try again."
       render :edit
     end
   end
   
  def destroy
     @sponsored_post = Sponsored_Post.find(params[:id])
 
     if @sponsored_post.destroy
       flash[:notice] = "\"#{@sponsored_post.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the Sponsored Post."
       render :show
     end
  end
end
