class FilmsController < ApplicationController
  def index
    @films = Film.all.order({ :created_at => :desc })

    render({ :template => "films/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @film = Film.where({:id => the_id }).at(0)

    render({ :template => "films/show.html.erb" })
  end

  def create
    user_id = @current_user.id
    @film = Film.new
    @film.title = params.fetch("title_from_query")
    @film.source = params.fetch("source_from_query")
    @film.users_id = session[:user_id]
    @film.genre_topic = params.fetch("genre_topic_from_query")
    @film.description = params.fetch("description_from_query")
    @film.comments = params.fetch("comments_from_query")

    if @film.valid?
      @film.save
      redirect_to("/films", { :notice => "Film created successfully." })
    else
      redirect_to("/films", { :notice => "Film failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @film = Film.where({ :id => the_id }).at(0)

    @film.title = params.fetch("title_from_query")
    @film.source = params.fetch("source_from_query")
    @film.users_id = params.fetch("users_id_from_query")
    @film.genre_topic = params.fetch("genre_topic_from_query")
    @film.description = params.fetch("description_from_query")
    @film.comments = params.fetch("comments_from_query")

    if @film.valid?
      @film.save
      redirect_to("/films/#{@film.id}", { :notice => "Film updated successfully."} )
    else
      redirect_to("/films/#{@film.id}", { :alert => "Film failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @film = Film.where({ :id => the_id }).at(0)

    @film.destroy

    redirect_to("/films", { :notice => "Film deleted successfully."} )
  end
end
