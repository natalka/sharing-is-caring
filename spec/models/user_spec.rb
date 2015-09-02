require 'spec_helper'

describe User do
  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
  it { should have_many :media_items }
  it { should have_many :owned_items }

  let(:user_ownes_media) { FactoryGirl.create(:user_with_owned_media) }
  let(:user_can_access_media) { FactoryGirl.create(:user_with_shared_media) }

  context '#relations' do
    it 'should own 1 item' do
      expect(user_ownes_media.owned_items.count).to eq(1)
      expect(user_ownes_media.media_items.count).to eq(1)
    end

    it 'should access 1 item' do
      expect(user_can_access_media.owned_items.count).to eq(0)
      expect(user_can_access_media.media_items.count).to eq(1)
    end
  end

end
