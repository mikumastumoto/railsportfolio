class UsersController < ApplicationController
  def index
    @users=User.all
  end
  def show
    @user=User.find_by(id:params[:id])
  end
  def new
   @user=User.new
  end
  def create
    @user=User.new(name:params[:name],email:params[:email],password:params[:password])
    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  #login
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/posts/index")
    else
      #user見つからない時loginformへ
      @error_message="メールアドレスまたはパスワードが間違えています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end

end
