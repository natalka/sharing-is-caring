require 'spec_helper'

describe MediaItemsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  let(:funny_item) { FactoryGirl.create(:funny_item) }
  let(:scary_item) { FactoryGirl.create(:scary_item) }

  it 'should return all published media' do
    get :index
    expect(response.status).to eq(200)
    expect(assigns(:media_items)).to eq([funny_item, scary_item])
  end


  let(:valid_attributes) { FactoryGirl.attributes_for(:media_item) }
  describe "POST create" do
    it "creates a new MediaItem" do
      expect {
        post :create, { user_id: @user.id, media_item: valid_attributes }
      }.to change(MediaItem, :count).by(1)
    end


    it "creates a new MediaItem" do
      paramz = valid_attributes.merge({"user_media_items_attributes" => [{"user_id" => "@user.id", "owner" => true }]})
      expect {
        post :create, { user_id: @user.id, media_item: paramz }
      }.to change(UserMediaItem, :count).by(1)
    end

  end

end
