class Api::ArticlesController < ApiController
  def index
    articles = Article.all  
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    # user = article.user
    # image_url = rails_blob_path(article.image)
    render json: article, serializer: ArticlesSerializer
  end
end
