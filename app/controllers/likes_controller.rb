class LikesController < ApplicationController
  def index
    @likes = Like.all.order({ :created_at => :desc })

    render({ :template => "likes/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @like = Like.where({:id => the_id }).at(0)

    render({ :template => "likes/show.html.erb" })
  end

  def create
    @like = Like.new
    @like.users_id = @current_user.id
    @like.films_id = params.fetch("film_id_from_query", nil)
    @like.shows_id = params.fetch("shows_id_from_query", nil)
    @like.podcasts_id = params.fetch("podcasts_id_from_query", nil)
    @like.articles_id = params.fetch("articles_id_from_query", nil)
    @like.books_id = params.fetch("books_id_from_query", nil)

    if @like.valid?
      @like.save
      redirect_to("/", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/", { :notice => "Bookmark failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @like = Like.where({ :id => the_id }).at(0)

    @like.users_id = @current_user.id
    @like.films_id = params.fetch("id_from_query", nil)
    @like.shows_id = params.fetch("id_from_query", nil)
    @like.podcasts_id = params.fetch("id_from_query", nil)
    @like.articles_id = params.fetch("id_from_query", nil)
    @like.books_id = params.fetch("id_from_query", nil)

    if @like.valid?
      @like.save
      redirect_to("/likes/#{@like.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/likes/#{@like.id}", { :alert => "Bookmark failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @like = Like.where({ :id => the_id }).at(0)

    @like.destroy

    redirect_to("/", { :notice => "Bookmark deleted successfully."} )
  end
end
