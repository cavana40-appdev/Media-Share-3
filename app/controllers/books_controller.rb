class BooksController < ApplicationController
  def index
    @books = Book.all.order({ :created_at => :desc })

    render({ :template => "books/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @book = Book.where({:id => the_id }).at(0)

    render({ :template => "books/show.html.erb" })
  end

  def create
    user_id = @current_user.id
    @book = Book.new
    @book.title = params.fetch("title_from_query")
    @book.author = params.fetch("author_from_query")
    @book.description = params.fetch("description_from_query")
    @book.users_id = session[:user_id]
    @book.genre_topic = params.fetch("genre_topic_from_query")
    @book.comments = params.fetch("comments_from_query")

    if @book.valid?
      @book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :notice => "Book failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @book = Book.where({ :id => the_id }).at(0)

    @book.title = params.fetch("title_from_query")
    @book.author = params.fetch("author_from_query")
    @book.description = params.fetch("description_from_query")
    @book.users_id = params.fetch("users_id_from_query")
    @book.genre_topic = params.fetch("genre_topic_from_query")
    @book.comments = params.fetch("comments_from_query")

    if @book.valid?
      @book.save
      redirect_to("/books/#{@book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{@book.id}", { :alert => "Book failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @book = Book.where({ :id => the_id }).at(0)

    @book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end
end
