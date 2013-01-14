class SessionsController < ApplicationController

  def new
    render :text => "<a class=\"btn btn-info\" href='/auth/twitter'>Login via Twitter</a>", :layout => true
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:uid => auth['uid'].to_s).first || User.create_from_auth_hash(auth)
    session[:user_id] = user.id
    render :text => "<h1>You're logged in!</h1><pre>"+user.to_yaml+"</pre>"
  end

  def failure
    render :text => "FAILURE :-("
  end

end
