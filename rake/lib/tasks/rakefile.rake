require 'rake' 
require 'spreadsheet'

namespace :load do
  desc "import flight routing"
  task :import => [:environment] do
    APP_ROOT = File.expand_path('./../../../', __FILE__)
    file = Spreadsheet.open "#{APP_ROOT}/public/Flights.xls"
    
    sheet1 = file.worksheet('Sheet1') 
    sheet1 = file.worksheet 0
    final_data = []
    flight_info = []

    sheet1.each do |row|
    
      if (row[0].present?) 
        flight_info = [{URL: row[0],Hop: row[1],dep_city_code: row[2],DCity: row[3],
             arr_city_code: row[4],ACity: row[5],dep_country_code: row[6],
             arr_country_code: row[7],path_name: row[8],country_code_dep: row[9],
             carriers_details: row[10],Dep_time: row[11],Arr_time: row[12],
             AirlineBrandName: row[13],Flight_no: row[14],dep_airport_code: row[15],
             arr_airport_code: row[16],dep_airport_IATA_code: row[17],
             arr_airport_IATA_code: row[18],average_travel_time: row[19]}] unless row[0] == "URL"

      elsif row[1] == nil
        #puts "new flight"
        final_data.push(flight_info)
        flight_info = []
      else
         flight_info.push(row.compact)
      end
    end
    #binding.pry  
    puts final_data.to_json
  end
end