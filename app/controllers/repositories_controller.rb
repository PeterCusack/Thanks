class RepositoriesController < ApplicationController
	allow_cors [:contributors]
	
	def contributors
		binding.pry
		user = User.last
		# user = User.find(session["user_id"])
		# params[:repositories][:repo_name]
		client = Octokit::Client.new(:access_token => user.githubauthkey)
		@response = client.contribs('octokit/octokit.rb')		
		# respond_to do |format|
			# format.js
		# end
		render json: @response
	end

	# def show
		# binding.pry
	# end
end
