require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

class ReportWorker
	include Sidekiq::Worker

  	def perform(complexity)
  		case complexity
  			when "super hard"
  				puts "its super hard complexity"
  				raise "something went wrong"
  				
  			when "hard"
  				sleep 10
  				puts "its hard complexity"				
  			
  			when "easy"
  				sleep 1
  				puts "its easy part"
  			
  			else
  				puts "its else part"
  		end
  	end
end