class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # binding.pry
  	# client = Octokit::Client.new(:access_token => env['omniauth.auth']['credentials']['token'])
    client =  Octokit::Client.new(:access_token => params['access_token'])

  	# env['omniauth.auth']['extra']['raw_info']['name']
  	# env['omniauth.auth']['extra']['raw_info']['avatar_url']
  	# env['omniauth.auth']['extra']['raw_info']['login']
  	# client.emails
  	# client.repositories
  	# client.organization_memberships

  	# binding.pry
  	# user = User.create(
  	# 	github_name: env['omniauth.auth']['extra']['raw_info']['name'],
  	# 	github_email: client.emails[0][:email],
  	# 	github_avatar_url: env['omniauth.auth']['extra']['raw_info']['avatar_url'],
  	# 	github_username: env['omniauth.auth']['extra']['raw_info']['login'],
   #    githubauthkey: env['omniauth.auth']['credentials']['token']
  	# )
  	# session[:user_id] = user.id
  	# redirect_to '/users/profile'

    render json: client
  end

  def show
  	@user = User.find(session[:user_id])
    render 'profile'
  end
end
