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
end
