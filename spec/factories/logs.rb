FactoryBot.define do
  factory :log do
    content { "右手とベースを合わせた" }
    start_time { Date.today }
    association :score
  end
end