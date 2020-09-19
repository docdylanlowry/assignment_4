class BooksController < ApplicationController

    layout 'admin'

    # GET, show new form
    def new
        @book = Book.new
    end

    # POST, create an item
    def create
        # create a new object, then save the object to process the form
        @book = Book.new(book_params)

        if @book.save
            flash[:notice] = "Book created successfully."
            redirect_to(books_path)
        else
            render('new')
        end
    end

    # GET, show all items
    def index
        @books = Book.order(:id)
    end

    # GET, show item with :id
    def show
        @book = Book.find(params[:id])
    end

    # GET, show edit form for item with :id
    def edit
        @book = Book.find(params[:id])
    end

    # PATCH, update item with :id
    def update
        # get an existing object, then save the object to process the form
        @book = Book.find(params[:id])

        if @book.update_attributes(book_params)
            flash[:notice] = "Book updated successfully."
            redirect_to(book_path(@book))
        else
            render('edit')
        end
    end

    # GET, show delete form for item with :id
    def delete
        @book = Book.find(params[:id])
    end

    # DELETE, delete item with :id
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "Book '#{@book.title}' destroyed successfully."
        redirect_to(books_path)
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :genre, :price, :published_date)
    end
end
