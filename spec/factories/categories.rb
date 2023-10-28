FactoryBot.define do
  factory :category do
    name { 'Sample Category' } # Provide a name for the category
    icon { 'icon-url' }
    user
  end
end
