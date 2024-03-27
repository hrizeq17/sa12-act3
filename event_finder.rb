require 'httparty'
require 'json'

api_key = 'm6MpHE40wOL1jVAqAGLT3poRdeSw5ezP'  
url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=#{api_key}"

response = HTTParty.get(url)

if response.success?
  events = JSON.parse(response.body)["_embedded"]["events"] rescue []

  if events.empty?
    puts "No upcoming events found in the United States."
  else
    puts "Upcoming events in the United States:"
    events.each_with_index do |event, index|
      puts "#{index + 1}: #{event['name']}"
      puts "Date: #{event['dates']['start']['localDate']} at #{event['dates']['start']['localTime']}"
      puts "URL: #{event['url']}\n\n"
    end
  end
else
  puts "Failed to retrieve events. Error: #{response.body}"
end
