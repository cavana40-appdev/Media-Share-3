class ShowsController < ApplicationController
  def index
    @shows = Show.all.order({ :created_at => :desc })

    render({ :template => "shows/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @show = Show.where({:id => the_id }).at(0)

    render({ :template => "shows/show.html.erb" })
  end

  def create
    user_id = @current_user.id
    @show = Show.new
    @show.title = params.fetch("title_from_query")
    @show.source = params.fetch("source_from_query")
    @show.users_id = session[:user_id]
    @show.genre_topic = params.fetch("genre_topic_from_query")
    @show.description = params.fetch("description_from_query")
    @show.comments = params.fetch("comments_from_query")

    if @show.valid?
      @show.save
      redirect_to("/shows", { :notice => "Show created successfully." })
    else
      redirect_to("/shows", { :notice => "Show failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @show = Show.where({ :id => the_id }).at(0)

    @show.title = params.fetch("title_from_query")
    @show.source = params.fetch("source_from_query")
    @show.users_id = params.fetch("users_id_from_query")
    @show.genre_topic = params.fetch("genre_topic_from_query")
    @show.description = params.fetch("description_from_query")
    @show.comments = params.fetch("comments_from_query")

    if @show.valid?
      @show.save
      redirect_to("/shows/#{@show.id}", { :notice => "Show updated successfully."} )
    else
      redirect_to("/shows/#{@show.id}", { :alert => "Show failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @show = Show.where({ :id => the_id }).at(0)

    @show.destroy

    redirect_to("/shows", { :notice => "Show deleted successfully."} )
  end
end
