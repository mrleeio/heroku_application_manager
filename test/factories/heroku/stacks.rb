FactoryBot.define do
  factory :heroku_stack, class: "Heroku::Stack" do
    name { Faker::App.name + " " + Faker::Number.number(digits: 4).to_s }
    heroku_identifier { SecureRandom.uuid }
    heroku_name { name.parameterize }
  end
end
