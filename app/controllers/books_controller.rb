class BooksController < ApplicationController

　

  #createは、ボダンを押した時に起こる動作、viewが無い ユーザーに見せる必要が無い
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]='Book was successfully created.'
      redirect_to books_path
    else render :new
   end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

#編集機能が上手くいかない
  def update
    book = Book.find(params[:id])
    book.update(book_params)
     #flash[:notice]='Book was successfully updateed.'
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     flash[:notice]='Book was successfully destroyed.'
     redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
