class ArticlePolicy < ApplicationPolicy

  def create?
    current_user.author? || current_user.editor?
  end

  def new?
    current_user.author? || current_user.editor?
  end

  def index?
    true
  end

  def show?
    !current_user.basic_user?
  end
  
end
