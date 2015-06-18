require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do

  meetups = Meetup.order("lower(name)")

  erb :index, locals: { meetups: meetups }
end

post '/' do

  if signed_in?
    new_meetup = Meetup.new(name: params[:name], description: params[:description], location: params[:location])
  else
    authenticate!
  end

  if new_meetup.save
    Membership.create(user_id: session[:user_id], meetup_id: new_meetup.id, owner: true)
    flash[:notice] = "The #{new_meetup.name} Meetup has been created!"
    redirect "/meetups/#{new_meetup.id}"
  else
    flash[:notice] = "This meetup already exists!"
    redirect "/"
  end
end

get '/meetups/:id' do

  meetup = Meetup.find(params[:id])

  erb :show, locals: { meetup: meetup }
end

post '/meetups/:id' do
  meetup = Meetup.find(params[:id])

  if signed_in?
    membership = Membership.new(user_id: session[:user_id], meetup_id: meetup.id, owner: false)
  else
    authenticate!
  end

  if membership.save
    flash[:notice] = "You've joined the #{meetup.name} Meetup!"
    redirect "/meetups/#{meetup.id}"
  else
    flash[:notice] = "You're already a member of this meetup!"
    redirect "/meetups/#{meetup.id}"
  end

end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end
