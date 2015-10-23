class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    newUser =  Octokit::Client.new(:access_token => params['access_token'])
    userFields = newUser.user
    if !(User.find_by(github_email: newUser.emails[0][:email]))
      User.create(
        github_name: userFields.name,
        github_email: newUser.emails[0][:email],
        github_avatar_url: newUser.user.avatar_url,
        github_username: userFields.login,
        githubauthkey: params['access_token']
      )
    end
    render json: {githubauthkey: params['access_token'], github_username: userFields.login, github_avatar_url: newUser.user.avatar_url}
  	# client.emails
  	# client.repositories
  	# client.organization_memberships
  end

  def show
    @user = User.find_by(githubauthkey: params["id"])
    # render json: {githubauthkey: @user.githubauthkey, github_username: @user.github_username, github_avatar_url: @user.github_avatar_url}
    render json: @user
  end

  # PUT /users/(github_username)
  # Usually used to add info after knew oauth step.
  def update 
    binding.pry
  end
end
