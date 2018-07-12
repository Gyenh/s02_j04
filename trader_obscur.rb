require 'rubygems'
require 'nokogiri'
require 'open-uri'

while true #Bonus

crypto_name = []
crypto_rate = []

def get_crypto_names(crypto_name)

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	doc.xpath('//a[@class= "currency-name-container link-secondary"]').each do |name|
  	
  	crypto_name << name.text #ça pond le texte oklm
    
    end
end

get_crypto_names(crypto_name)

def get_crypto_rates (crypto_rate)

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc.xpath('//a[@class="price"]').each do |rate|
    
    crypto_rate << rate.text #ça pond le texte oklm
    
    end
end

	get_crypto_rates(crypto_rate)

	hash = crypto_name.zip(crypto_rate).to_h
	puts hash

	sleep 3600 #Bonus
	
end