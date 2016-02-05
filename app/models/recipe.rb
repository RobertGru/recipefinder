class Recipe
	include HTTParty	
	
	key_value = ENV["FOOD2FORK_KEY"] || "a76fab41679e3a6f2d7b0d54a40e38c1"
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'  
  base_uri "http://#{hostport}/api"
	default_params key: key_value
	format :json

	def self.for keyword
		get("/search", query: { q: keyword } )["recipes"]
	end
end
