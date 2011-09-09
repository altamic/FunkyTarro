class FacebookController < ApplicationController
  def show
    if session['access_token']
      @face = 'You are logged in!, <a href="facebook/logout">Logout</a>'
    else
      @face = '<a href="facebook/login">Login</a>'
    end
  end

  def login
    session['oauth'] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET,
                                                  "http://funky-tarro.heroku.com/facebook/callback")
    redirect_to session['oauth'].url_for_oauth_code
  end

  def logout
    session['oauth'] = nil
    session['access_token'] = nil
    redirect_to '/facebook/show'
  end

  def callback
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to '/facebook/menu'
  end

  def menu
    @ok="you are welcome"
    if session['access_token']
      @face='You are logged in! <a href="/facebook/logout">Logout</a>'
    else
      @face='<a href="/facebook/login">Login</a>'
    end
  end
end
