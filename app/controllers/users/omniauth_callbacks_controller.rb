class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def venmo
    if current_user
      auth = request.env['omniauth.auth']
      current_user.provider = auth.provider
      current_user.uid = auth.uid
      current_user.token = auth.credentials.token
      current_user.save
      redirect_to edit_user_path(current_user), notice: 'Venmo account linked successfully.'
    else
      @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
	sign_in_and_redirect @user, :event => :authentication
	set_flash_message(:notice, :success, :kind => "Venmo") if is_navigational_format?
      else
	session["devise.twitter_uid"] = request.env["omniauth.auth"]
	redirect_to new_user_registration_url
      end
    end
  end
end
