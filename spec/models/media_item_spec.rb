require 'spec_helper'

describe MediaItem do
  let(:media_item) { FactoryGirl.build(:media_item) }

  it 'should not be published be default' do
    expect(MediaItem.new).to_not be_published
  end

  it { should validate_presence_of :source_link }
  it { should have_many :users }

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

  context '#fetching video id from YouTube link' do
    let(:media_item_1) { FactoryGirl.build(:media_item,
      source_link: "http://youtu.be/sGE4HMvDe-Q")
    }
    let(:media_item_2) {FactoryGirl.build(:media_item,
      source_link: "https://www.youtube.com/p/A0C3C1D163BE880A?hl=en_US&fs=1")
    }

    it 'should be valid for correct youtube link' do
      expect(media_item.youtube_id).to eq("_NsE9bmDEb4")
    end

    it 'should be valid for correct youtu.be link' do
      expect(media_item_1.youtube_id).to eq("sGE4HMvDe-Q")
    end

    it 'should be valid for correct youtube (fullscreen mode) link' do
      expect(media_item_2.youtube_id).to eq("p/A0C3C1D163BE880A")
    end
  end

end
