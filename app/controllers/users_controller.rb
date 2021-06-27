class UsersController < Clearance::UsersController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Signup Successful'
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :email,
                                 :password,
                                 :bio,
                                 :address,
                                 :terms_of_service,
                                )
  end
end
