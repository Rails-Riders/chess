FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "doh#{n}@gmail.com"
    end
    password "123123123"
    password_confirmation "123123123"
  end

  factory :game do
    id 1
  end

  trait :game_state do
    game_state nil
  end

  trait :player_turn do
    player_turn nil
  end

  trait :turn_count do
    turn_count 0
  end

  trait :black_player_id do
    black_player_id nil
  end

  trait :white_player_id do
    white_player_id nil
  end

  trait :winning_player_id do
    winning_player_id nil
  end

  trait :user_id do
    user_id nil
  end
end
