class RegistrationsController < Devise::RegistrationsController

	private

		def after_inactive_sign_up_path_for(resource)
	    	new_khach_hang_session_path
	 	end

end