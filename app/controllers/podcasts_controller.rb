class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all.order({ :created_at => :desc })

    render({ :template => "podcasts/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @podcast = Podcast.where({:id => the_id }).at(0)

    render({ :template => "podcasts/show.html.erb" })
  end

  def create
    user_id = @current_user.id
    @podcast = Podcast.new
    @podcast.title = params.fetch("title_from_query")
    @podcast.source = params.fetch("source_from_query")
    @podcast.favorite_episode = params.fetch("favorite_episode_from_query")
    @podcast.users_id = session[:user_id]
    @podcast.genre_topic = params.fetch("genre_topic_from_query")
    @podcast.description = params.fetch("description_from_query")
    @podcast.comments = params.fetch("comments_from_query")

    if @podcast.valid?
      @podcast.save
      redirect_to("/podcasts", { :notice => "Podcast created successfully." })
    else
      redirect_to("/podcasts", { :notice => "Podcast failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @podcast = Podcast.where({ :id => the_id }).at(0)

    @podcast.title = params.fetch("title_from_query")
    @podcast.source = params.fetch("source_from_query")
    @podcast.favorite_episode = params.fetch("favorite_episode_from_query")
    @podcast.users_id = params.fetch("users_id_from_query")
    @podcast.genre_topic = params.fetch("genre_topic_from_query")
    @podcast.description = params.fetch("description_from_query")
    @podcast.comments = params.fetch("comments_from_query")

    if @podcast.valid?
      @podcast.save
      redirect_to("/podcasts/#{@podcast.id}", { :notice => "Podcast updated successfully."} )
    else
      redirect_to("/podcasts/#{@podcast.id}", { :alert => "Podcast failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @podcast = Podcast.where({ :id => the_id }).at(0)

    @podcast.destroy

    redirect_to("/podcasts", { :notice => "Podcast deleted successfully."} )
  end
end
