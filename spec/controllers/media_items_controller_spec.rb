require 'spec_helper'

describe MediaItemsController, type: :controller do

  it 'should return all published media' do
    get :index
    expect(response.status).to eq(200)
  end

end
