FactoryBot.define do
  factory :comment do
    comment { 'コメントテスト' }
    association   :user
    association   :item
  end
end
