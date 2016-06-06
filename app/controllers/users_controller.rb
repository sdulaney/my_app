class UsersController < ApplicationController
  
  def find
      @users = User.where( "name = ? OR email = ?", params[ :search_string ], params[ :search_string] )
  end
  
  def show
    @user = User.find(params[:id])
    @links = @user.links.paginate(page: params[:page])
  end 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to the TwitHub!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
