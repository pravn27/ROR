require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

class ReportWorker
	include Sidekiq::Worker
  
  sidekiq_options :queue => :first, :retry => false

  	def perform(complexity)
      
  		case complexity
  			when "super hard"
          sleep 30
  				puts "its super hard complexity"
  				
  			when "hard"
  				sleep 10
  				puts "its hard complexity"				
  			
  			when "easy"
  				sleep 1
  				puts "its easy part"
  			
  			else
          while true do
            sleep 1
            puts "while part"
          end
  				puts "its else part"
  		end 
  	end
end