require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  
  let (:my_ad) do 
    Advertisement.create(
      id: 1, 
      title: RandomData.random_sentence, 
      copy: RandomData.random_paragraph, 
      price: 90
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_ad] to @advertisement" do 
      get :index
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end

end
