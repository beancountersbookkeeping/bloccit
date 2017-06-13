class WelcomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def about
  end
  
  def contact
  end
  
  def faq
  end
  
end
