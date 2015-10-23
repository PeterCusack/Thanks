class RepositoriesController < ApplicationController
	allow_cors [:contributors]
	
	def contributors
		url_array = params["repoURL"].split("/")
		repo_name = url_array[-2] + "/" + url_array[-1]		
		user = User.find_by(github_username: params["userName"])
		client = Octokit::Client.new(:access_token => user.githubauthkey)
		@response = client.contribs(repo_name)		
		render json: @response
	end

	# def show
		# binding.pry
	# end
	
end
