class Area < ApplicationRecord
    
    def self.import(file, name)
        
        gmaps = GoogleMapsService::Client.new(key:Rails.application.credentials.google_maps_api_key)

        #Loop through each row of the CSV data adding the data to the database
        CSV.foreach(file.path, headers: true) do |row| 
            unless row[0] == nil
                
                #use geocoder in google_maps_service gem to return a hash of the latitude and longitude for that location
                lat_lng = gmaps.geocode(row[1])[0][:geometry][:location]

                #add the row into the database
                area = Area.create(
                    name: name,
                    #add the location of the disabled parking spot    
                    location: row[1],
                    #add the number of spaces at that location
                    spaces: row[2],
                    #add the latitude
                    lat: lat_lng[:lat],
                    #add the longitude
                    lng: lat_lng[:lng]
                )
            end
        end
    end
end
