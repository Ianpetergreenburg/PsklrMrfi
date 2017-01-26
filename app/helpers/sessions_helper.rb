module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    current_user
  end

  def current_user_commissioner?
    current_user == User.find_by(username: "the_commish")
  end

  def login(user)
    session[:id] = @user.id
  end

  def logout
    session[:id] = nil
  end

  def login_errors(form_params)

    case
    when form_params['password_digest'].empty?
      return "Please enter your password. Password field required."
    when form_params['username'].empty?
      return "Please enter your user-name."
    else
      return "We do not have you on record."
    end

  end

end
