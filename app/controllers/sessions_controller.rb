class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]

    if login(name, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to login_url
  end

  private

  def login(name, password)
    @user = User.find_or_create_by(name: name)

    if @user.save && @user.authenticate(password)
      session[:user_id] = @user.id
      true
    else
      false
    end
  end
end