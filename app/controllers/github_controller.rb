class GithubController < ApplicationController
	# allow_cors [:login_html]
	skip_before_action :verify_authenticity_token, :only => [:login_html, :code_for_token]

	def code_for_token
		@github_response = HTTParty.post("https://github.com/login/oauth/access_token?", 
			:headers => {"Accept" => "application/json"}, 
			:body => {
				"code" => params["code"], 
				"client_secret" => ENV["GITHUB_KEY"], 
				"client_id" => ENV["GITHUB_SECRET"]
			})
		binding.pry 
		render json: {apiInfo: @github_response, apiProvider: "github"}
	end


end
