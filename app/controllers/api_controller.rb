class ApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	def webflow 
		api_provider = ApiProvider.find_by(name: params[:provider].downcase)
		render json: api_provider
	end
end
