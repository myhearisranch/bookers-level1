class BooksController < ApplicationController



  #createは、ボダンを押した時に起こる動作、viewが無い ユーザーに見せる必要が無い
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]='Book was successfully created.'
      redirect_to book_path(@book.id)
    else render :index
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

#バリデーションが表示されない
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice]='Book was successfully updateed.'
        redirect_to book_path(@book.id)
    else render :edit
    end
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
