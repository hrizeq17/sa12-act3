require 'httparty'
require 'json'
api_key = '48e04cf170c2cb03e5f6ccaf'
source_currency = 'KWD'
target_currency = 'JOD'
amount_to_convert = 100
url = "https://api.exchangerate-api.com/v4/latest/#{source_currency}?apikey=#{api_key}"
response = HTTParty.get(url)
if response.success?
    rates = JSON.parse(response.body)['rates']
    exchange_rate = rates[target_currency]
    converted_amount = amount_to_convert * exchange_rate
    puts "Exchange Rate: #{exchange_rate}"
  puts "#{amount_to_convert} #{source_currency} is equal to #{converted_amount.round(2)} #{target_currency}"
else
  puts "Failed to retrieve exchange rate."
end