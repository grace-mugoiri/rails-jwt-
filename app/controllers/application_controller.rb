class ApplicationController < ActionController::API
	def not_found
		render json: { error: 'not_found'}
	end

	def authorize_request
		header = request.headers.headers['Authorization']
		header = header.split(' ').last if header
		begin
			@decoded = JsonWebToken.decode(header)
			@current_user = User.find(@decoded[:user_id])
		rescue json: { errors: e.message }, status: :message
end
