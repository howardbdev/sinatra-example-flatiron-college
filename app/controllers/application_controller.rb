class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "flatiron-college"
    register Sinatra::Flash
  end

  get "/" do
    redirect '/login' # => what happens is we fire a new request, GET '/login'
  end

# I could build a sessions controller to handle logging in and out
  get('/login') do
    if logged_in?
      redirect "/instructors/#{current_user.id}"
    else
      erb :login # is there a file, app/views/login.erb ??? if so, add its contents to the web page
    end
  end

  post '/login' do
    # what do I want to do here??
    # 1. Get the credentials from the form and see if it matches an Instructor
    # 2. If so, log that instructor in, and .... ?
    # 3. If not, redirect back to login with a message saying bad credentials

    # where do I get the info from the form????
    # params is the hash that carries info from forms
    instructor = Instructor.find_by(email: params[:email])
    if instructor.authenticate(params[:password])
      # I want to set the session!
      session[:user_id] = instructor.id
      redirect "/instructors/#{instructor.id}"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Instructor.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
