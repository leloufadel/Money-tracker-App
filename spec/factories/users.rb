FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password123' }
    # If you want to associate categories with users
    factory :user_with_categories do
      transient do
        categories_count { 2 } # You can change this count as needed
      end

      after(:create) do |user, evaluator|
        create_list(:category, evaluator.categories_count, author: user)
      end
    end
  end
end
