RSpec.describe 'Api::ArticlesController', type: :request do

  let!(:articles) { 5.times {create(:article)}}
  let!(:article) { create(:article, title: 'Rails 5 is awesome!')}
  describe "GET /api/articles" do
    before do 
      get '/api/articles'
    end
    it "returns a collection of 5 articles" do
      expect(JSON.parse(response.body).count).to eq 5
    end
  end

  describe "GET /api/articles/:id" do  
    before do  
      get "/api/articles/#{article.id}"
    end

    it 'retuns an instance of Article' do 
      binding.pry
      expect(JSON.parse(response.body)['title']).to eq 'Rails 5 is awesome!'
    end
  end
end
