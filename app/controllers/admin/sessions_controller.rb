class Admin::SessionsController < Admin::ApplicationController

	before_action :authorize, except: [:new, :create]
	layout 'login'

	def new
	end

	def create
		@moderator = Moderator.find_by(username: params[:username]).try(:authenticate, params[:password])
		if @moderator
			session[:current_moderator_id] = @moderator.id
			redirect_to admin_hang_hoas_url, notice: 'Successfully logged in'
		else
			flash[:alert] = 'Wrong username / password'
			render 'new'
		end
	end

	def destroy
		session[:current_moderator_id] = nil
		redirect_to '/login', notice: 'Successfully logged out'
	end
end
