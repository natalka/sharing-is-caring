require 'spec_helper'

describe MediaItem do
  let(:media_item) { FactoryGirl.build(:media_item) }


  it 'should not be published be default' do
    expect(MediaItem.new).to_not be_published
  end

  it { should validate_presence_of :source_link }

  context '#validates YouTube url' do
    let(:media_item_domain) { FactoryGirl.build(:media_item_wrong_domain) }
    let(:media_item_uri) { FactoryGirl.build(:media_item_wrong_uri) }

    it 'should be valid for correct youtube link' do
      expect(media_item).to be_valid
    end

    it 'should not be valid incorrect domain link' do
      expect(media_item_domain).to_not be_valid
    end

    it 'should not be valid incorrect params' do
      expect(media_item_uri).to_not be_valid
    end
  end

end
