class ArticlesController < ApplicationController


=begin
  An HTTP GET to /resources/new is intended to render a form suitable for creating a new resource,
which it does by calling the new action within the controller, which creates a new unsaved record and renders the form.

An HTTP POST to /resources takes the record created as part of the new action and passes
it to the create action within the controller, which then attempts to save it to the database.

=end

  def new
    @article = Article.new
  end

  #create an article (post)
  def create
    @article = Article.new(article_params)

    if @article.save
    redirect_to @article
    else
      render 'new'
      end
  end

  #view an article
  def show
    @article = Article.find(params[:id])
    
  end

  #list the articles
  def index
    @articles = Article.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
