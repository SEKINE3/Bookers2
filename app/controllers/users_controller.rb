class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :authenticate_user, only:[:edit]
	def show
		@newbook = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

	def index
		@newbook = Book.new
		@user = current_user
		@users = User.all
	end

	def create
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id)
	    flash[:notice] = 'You have updated user successfully.'
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def authenticate_user
		if params[:id].to_i != current_user.id
	   		redirect_to user_path(current_user.id)
		end
	end

end
