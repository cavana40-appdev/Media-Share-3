class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order({ :created_at => :desc })

    render({ :template => "articles/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @article = Article.where({:id => the_id }).at(0)

    render({ :template => "articles/show.html.erb" })
  end

  def create
    user_id = @current_user.id
    @article = Article.new
    @article.title = params.fetch("title_from_query")
    @article.author = params.fetch("author_from_query")
    @article.link = params.fetch("link_from_query")
    @article.users_id = session[:user_id]
    @article.genre_topic = params.fetch("genre_topic_from_query")
    @article.description = params.fetch("description_from_query")
    @article.comments = params.fetch("comments_from_query")

    if @article.valid?
      @article.save
      redirect_to("/articles", { :notice => "Article created successfully." })
    else
      redirect_to("/articles", { :notice => "Article failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @article = Article.where({ :id => the_id }).at(0)

    @article.title = params.fetch("title_from_query")
    @article.author = params.fetch("author_from_query")
    @article.link = params.fetch("link_from_query")
    @article.users_id = params.fetch("users_id_from_query")
    @article.genre_topic = params.fetch("genre_topic_from_query")
    @article.description = params.fetch("description_from_query")
    @article.comments = params.fetch("comments_from_query")

    if @article.valid?
      @article.save
      redirect_to("/articles/#{@article.id}", { :notice => "Article updated successfully."} )
    else
      redirect_to("/articles/#{@article.id}", { :alert => "Article failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @article = Article.where({ :id => the_id }).at(0)

    @article.destroy

    redirect_to("/articles", { :notice => "Article deleted successfully."} )
  end
end
