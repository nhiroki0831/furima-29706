FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(max_length: 6) }
    password_confirmation { password }
    first_name            { 'あああ' }
    family_name           { 'あああ' }
    first_name_k          { 'アアア' }
    family_name_k         { 'アアア' }
    birthday              { '1930/01/01' }
  end
end
