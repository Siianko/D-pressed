FactoryBot.define do
    factory :article do
        title { "MyString" }
        body { "MyText" }
        user
        category
        after(:build) do |article|
            article.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpeg')), filename: "image.jpeg", content_type: 'image/jpg')
        end
    end
end
