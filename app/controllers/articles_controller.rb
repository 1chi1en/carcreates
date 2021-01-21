class ArticlesController < ApplicationController
  #protect_from_forgery :except => [:destroy] 
  #destroyアクションが動かなかったら上記をONにして、showアクションのlink_toをbutton_toにする
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
    @articles = Article.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless current_user.id == @article.user_id
      redirect_to root_path
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def show
    @user = User.all
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
  end 

  def destroy
    if current_user.id == @article.user_id
      @article.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def find
    @article = Article.find(params[:id]) #show,edit,update,destroy
  end

  def article_params
    params.require(:article).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

end
