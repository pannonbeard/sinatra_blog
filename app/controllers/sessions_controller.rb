class SessionsController < ApplicationController
  get '/users/sign_up' do
    haml :'sessions/sign_up'
  end

  post '/users/sign_up' do
    user = User.new(email: params[:email])
    user.password = params[:password]

    if user.save
      session[:user_id] = user.id
      redirect '/posts'
    else
      redirect 'sessions/users/sign_up'
    end
  end

  get '/users/sign_in' do
    haml :'sessions/sign_in'
  end

  post '/users/sign_in' do
    user = User.first(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash[:error] = "Credentials invalid or User doesn't exist"
      redirect '/'
    end
  end

  delete '/sign_out' do
    session.delete(:user_id)

    redirect '/'
  end
end