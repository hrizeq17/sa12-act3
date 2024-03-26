require 'httparty'
require 'json'
api_key = ENV["OPENWEATHER_API_KEY"]
city_name = "Memphis"
url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_key}&units=imperial"
response = HTTParty.get(url)
if response.code == 200
    weather_data = JSON.parse(response.body)
    temp = weather_data["main"]["temp"]
    humidity = weather_data["main"]["humidity"]
    conditions = weather_data["weather"].first["description"]

    puts "Current weather in #{city_name}:"
    puts "Temperature: #{temp}°F"  # Note the change to Fahrenheit
    puts "Humidity: #{humidity}%"
    puts "Conditions: #{conditions}"

else
    puts "Failed to retrieve weather data. Response code: #{response.code}"
end