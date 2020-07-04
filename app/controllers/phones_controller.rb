class PhonesController < ActionController::Base
	 skip_before_action :verify_authenticity_token  


	def index
		phone_number = Phone.where(available: false).pluck(:number)
		render json: {phones: phone_number}
	end

	def create
		if allot_number
			render json: {phone: create_phone.number}
		else
			allot_number
			render json: {phone: create_phone.number}
		end
	end

	def fancy_number
		phone = Phone.find_by(number: params[:number])
		if phone
			allot_number
			render json: {phone: create_phone.number}
		else
			phone = Phone.create(number: params[:number])
			Client.create(phone_number: phone.number)
			phone.update(available: false)
			render json: {phone: phone.number}
		end
	end

	private

	def generate_number
		rand(1_111_111_111..9_999_999_999)
	end

	def allot_number
		unless check_number_exit?
			update_phone
		else
			update_phone
		end
	end

	def update_phone
		create_phone
		Client.create(phone_number: create_phone.number)
		create_phone.update(available: false)
	end

	def check_number_exit?		
		Phone.find_by(number: generate_number)
	end
	def create_phone
		@phone ||= Phone.create(number: generate_number)
	end
end
