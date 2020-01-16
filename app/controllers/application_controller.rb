class ApplicationController < ActionController::Base
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :frist_name_kana, :postal_code, :address, :phone])
		end
	private
		def after_sign_in_path_for(resource)
			case resource
				when Admin
				admins_path
				when User
				root_path
			end
		end
		def after_sign_out_path_for(resource)
			case resource
				when :admin
				new_admin_session_path
				when :user
				root_path
			end
		end
end
