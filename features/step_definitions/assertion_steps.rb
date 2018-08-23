Then("I should see {string}") do |content|
    expect(page).to have_content content
end

And("there should be a Article titled {string} in the database") do |expected_title|
    expect(Article.last.title).to eq expected_title
end

Then("I should see the ad {string}") do |ad_name|
    expect(page).to have_css(ad_name)
end

Given("the date is {string}") do |date_string|
    date = Date.parse(date_string)
    Timecop.travel(date)
  end

After do
    Timecop.return
end

When("I attach an image-file") do
    attach_file('article_image', "#{::Rails.root}/spec/fixtures/dummy.jpeg")
end

Then("I should see the {string} image") do |file_name|
    expect(page).to have_selector "img[src$='#{file_name}']"
end
  
Then("I should be redirected to the {string} page") do |page|
    expect(current_path).to eq page_path(page)    
end

Then("I should be on the show page for {string}") do |article_title|
    article = Article.find_by(title: article_title)
    expect(current_path).to eq article_path(article)
end
