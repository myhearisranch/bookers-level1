class BooksController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    #空のモデルが生成され、インスタンス変数@listに代入されてViewで利用できるようになります。
    @book = Book.new
  end

  def create
     # １. データを新規登録するためのインスタンス作成
     #list_paramsではフォームで入力されたデータを受け取っています。
    book = Book.new(book_params)
     # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
     # ３. トップ画面へリダイレクト
     redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def destroy
    book = Books.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.permit(:title, :body)
  end

end
