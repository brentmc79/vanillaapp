class SessionsController < ApplicationController

  def new
    render :text => "Authenticate with: <ul style='font-size: 20pt;'><li style='margin: 15px;'><a href='/auth/twitter'>Login via Twitter</a></li></ul>", :layout => true
  end

  def create
    render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"
  end

  def failure
    render :text => "FAILURE :-("
  end

end
