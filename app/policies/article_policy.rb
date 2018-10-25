class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @article = article
  end

  def show?
    @user.permissions.includes(:user_permissions).where(action: 'show', article: @article).exists? || @user.author_of?(@article)
  end

  def update?
    @user.permissions.includes(:user_permissions).where(action: 'update', article: @article).exists? || @user.author_of?(@article)
  end
end
