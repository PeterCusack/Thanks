class PaymentController < ApplicationController
	skip_before_action :verify_authenticity_token
	helper payout_bitcoin
	def github_bitcoin
		# combine two arrays into one 2d array in format [[username, payment], [username, payment]]
		users_payments_2d = params['contribsUserNames'].zip(params["userPayoutArray"])
		# create a 2d array with one array being of users we cant payout to becasue they are not users of thanks and the other is users we will payout to
		binding.pry
		# Once coinbase is all set up the find_by should be changed too User.find_by("github_username = ? AND coinbase_username = ?", username_and_payment[0], !nil)
		payable_nonpayable_users_2d = users_payments_2d.partition {|username_and_payment| User.find_by(github_username: username_and_payment[0])}
		# send only payable users to helper
		payout_bitcoin(payable_nonpayable_users_2d[0], "bitcoin")

		render json: payable_nonpayable_users_2d
	end
end
