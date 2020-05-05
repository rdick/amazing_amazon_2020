FactoryBot.define do
  factory :newsarticle, class: 'newsarticle' do
    sequence(:title) {|n| Faker::Job.title + " #{n} "}
    description {Faker::Address.city}
    published_at {DateTime.now}
  end
end

# To Call this FactoryBot
# FactoryBot.create(:job_post)

