FactoryBot.define do
  factory :score do
    title { "歓喜の歌" }
    grade { 6 }
    start_date { Date.today - 10 }
    completion_date { Date.today }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png")) }
    status { 1 }
    point { "メモ" }
    association :user
  end
end