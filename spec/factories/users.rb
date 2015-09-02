FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    firstname 'John'
    lastname 'Deer'
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :media_owner, parent: :user do
    firstname 'Mike'
  end

  factory :user_media_item , class: 'UserMediaItem' do
    association :user, :media_owner
    owner true
    media_item
  end

  factory :user_media_item_not_owned , class: 'UserMediaItem' do
    user
    owner false
    media_item
  end

  factory :user_with_owned_media, parent: :media_owner do
    after(:create) { |media_owner| create(:user_media_item, user: media_owner) }
  end

  factory :user_with_shared_media, parent: :user do
    after(:create) { |user| create(:user_media_item_not_owned, user: user) }
  end

end