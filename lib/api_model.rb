require 'faraday'
require 'faraday_middleware'

class NotImplementedError < SystemError;end
class APIModel
	include ActiveModel::Validations

	class << self
		attr_accessor :resource

		def find scope
		end

		def conn
			@conn ||= Faraday.new 'https://git-api.modelmetrics.com' do |conn|
				conn.request :json
				conn.response :json, :content_type => /\bjson$/

				conn.adapter Faraday.default_adapter
			end
		end
	end

	

	def create
		raise NotImplementedError 'Please implement this method in your subclass.'
	end

	def update
		raise NotImplementedError 'Please implement this method in your subclass.'
	end

	def delete
		raise NotImplementedError 'Please implement this method in your subclass.'
	end
end