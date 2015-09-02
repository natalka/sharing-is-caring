FactoryGirl.define do
  factory :media_item do
    source_link "https://www.youtube.com/watch?v=_NsE9bmDEb4"
  end

  factory :media_item_wrong_domain, parent: :media_item do
    source_link "https://www.youtube.mistake.com/watch?v=_NsE9bmDEb4"
  end
  factory :media_item_wrong_uri, parent: :media_item do
    source_link "https://www.youtube.com/watch?"
  end

  factory :funny_item, parent: :media_item do
    source_link "https://www.youtube.com/watch?v=Funny_Movie"
    published true
  end

  factory :scary_item, parent: :media_item do
    source_link "https://www.youtube.com/watch?v=Scary_Movie"
    published true
  end

  factory :funny_item_user_media_item , class: 'UserMediaItem' do
    user
    owner true
    association :media_item, :funny_item
  end

  factory :scary_item_user_media_item , class: 'UserMediaItem' do
    user
    owner true
    association :media_item, :scary_item
  end

  factory :published_funny_media_item, parent: :funny_item do
    after(:create) {
      |funny_item| create(:funny_item_user_media_item, media_item: funny_item)
    }
  end

  factory :published_scary_media_item, parent: :scary_item do
    after(:create) {
      |scary_item| create(:scary_item_user_media_item, media_item: scary_item)
    }
  end

end
