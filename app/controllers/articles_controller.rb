class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.persisted?
      redirect_to root_path, notice: 'Article successfully created.'
    else
      flash[:error] = 'Fields can\'t be blank. Your article could not be saved'
      render :new
    end
  end
  
   private
   def article_params
    params.require(:article).permit(:title, :body)
  end
end
