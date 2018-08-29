Given("the following article exists/exist") do |table|
    table.hashes.each do |article_hash|
        create(:article, article_hash)
    end
end

Given("the following user(s) exist/exists") do |table|
    table.hashes.each do |user_hash|
        user = create(:user, user_hash.except('location'))
        # extract this to a separate method
        if user_hash[:location].present? 
            location = user_hash[:location]
            case location
            when 'Stockholm'
                coords = [59.334591, 18.063240]
            else
                coords = [57.708870, 11.974560]
            end            
            user.latitude = coords[0]
            user.longitude = coords[1]
            user.save
        end
    end
end

Given("the following categories exist") do |table|
    table.hashes.each do |category_hash|
        create(:category, category_hash)
    end
end