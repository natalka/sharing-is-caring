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

  factory :user_media_item , class: 'UserMediaItem' do
    user
    owner true
    media_item
  end

  factory :user_media_item_not_owned , class: 'UserMediaItem' do
    user
    owner false
    media_item
  end

  factory :user_with_owned_media, parent: :user do
    after(:create) { |user| create(:user_media_item, user: user) }
  end

  factory :user_with_shared_media, parent: :user do
    after(:create) { |user| create(:user_media_item_not_owned, user: user) }
  end

end