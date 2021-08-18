class BooksController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    #空のモデルが生成され、インスタンス変数@listに代入されてViewで利用できるようになります。
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]='Book was successfully created.'
      redirect_to books_path
    else render :new
   end
  end

  def index
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
     flash[:notice]='Book was successfully updateed.'
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
    params.permit(:title, :body)
  end

end
