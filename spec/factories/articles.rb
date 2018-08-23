FactoryBot.define do
    factory :article do
        title "MyString"
        body "MyText"
        user
        after(:build) do |article|
            article.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpeg')), filename: "image.jpeb", content_type: 'image/jpg')
        end
    end
end
