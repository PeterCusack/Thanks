class CoinbaseController < ApplicationController
	skip_before_action :verify_authenticity_token 
	#websitename.com/api/coinbase/code_for_token
	def code_for_token
		# HTTParty.post("https://api.coinbase.com/oauth/token?grant_type=authorization_code&code=" + params["code"] + "&client_id=" + ENV["COINBASE_KEY"] + "&client_secret=" + ENV["COINBASE_SECRET"] + "&redirect_uri=https://example.com/oauth/callback",
			# binding.pry
		@coinbase_user_token = HTTParty.post("https://api.coinbase.com/oauth/token/",
			:headers => {"Accept" => "application/json"}, 
			:query => { 
				"grant_type" => "authorization_code",
				"code" => params["code"],
				"client_id" => ENV["COINBASE_KEY"],
				"client_secret" => ENV["COINBASE_SECRET"],
				"redirect_uri" => "http://fuf.me:3000/api/coinbase/token-callback"
			}
		)
	# binding.pry
		@coinbase_user_token = HTTParty.post("https://api.coinbase.com/oauth/token/",
			:headers => {"Accept" => "application/x-www-form-urlencoded"}, 
			:data => "grant_type=authorization_code&code=" + params["code"] + "&client_id=" + ENV["COINBASE_KEY"] + "&client_secret=" + ENV["COINBASE_SECRET"] + "&redirect_uri=http://fuf.me:3000/api/coinbase/token-callback" 
		)
		binding.pry
		render json: {apiInfo: @coinbase_user_token, apiProvider: "coinbase"}
	end

	def token_callback
		binding.pry
	end
end

