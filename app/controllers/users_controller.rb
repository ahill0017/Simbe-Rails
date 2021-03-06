class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy, :edit]
	before_filter :authorize, except: [:new, :create]

	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, 
			notice: "#{@user.name}, your account was successfully created."
		else
			render :new
		end
	end
	def edit
	end
	def update
		if @user.update(user_params)
			redirect_to @user, notice: 'Update successful'
		else
			render :edit
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
	end
end
