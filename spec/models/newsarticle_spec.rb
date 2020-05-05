require 'rails_helper'
require 'byebug'

RSpec.describe Newsarticle, type: :model do
  describe "validates" do
    describe "title" do
      it "is required" do
        #Given
        newsarticle = FactoryBot.build(:newsarticle, title: nil)
        
        #When
        newsarticle.valid?
        #Then
        expect(newsarticle.errors.messages).to(have_key(:title))

      end
      it "is unique" do
        newsarticle1 = Newsarticle.create(title: 'dog', description: "1231", published_at: Faker::Date.forward(days: 14))
        newsarticle2 = Newsarticle.new(title: newsarticle1.title, description: "1231", published_at: Faker::Date.forward(days: 14))

        newsarticle2.valid?
        expect(newsarticle2.errors.messages).to(have_key(:title))
      end
    end
    describe "description" do
      it "is required" do
        newsarticle3 = FactoryBot.build(:newsarticle,description: nil)

        newsarticle3.valid?

        expect(newsarticle3.errors.messages).to(have_key(:description))
      end
    end
    describe "published date" do
      it "is after created at" do 
        newsarticle4 = Newsarticle.new(title: 'dog', description: "1231", published_at: nil)

      #  not sure how to do this one

      end
    end
  end

end

# title must be present
# title is unique
# description must be present
# published_at must be after created_at date (you will need to write a custom validation to implement this)