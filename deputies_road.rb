require 'rubygems'
require 'nokogiri'
require 'open-uri'

@first_name = []
@last_name = []

################################################################################################################################################################################################################
############################ 			Création d'une méthode pour prendre tous le noms et prénoms du site et stocker dans un fucking array			########################################################
################################################################################################################################################################################################################

def get_thoses_fucking_name
	names = []
	
	page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576'))
	page.css('h2[class = titre_normal]').each do |nom|
    
    names << nom.text
end

	names.map! { |item| item.delete_prefix("M ") }
	names.map! { |item| item.delete_prefix("Mme ") }								# .map! Invokes the given block once for each element of self, replacing the element with the value returned by the block.
	names.each { |item| array = item.split(" ")										
 	
 	@first_name << array[0]
  
  	@last_name << array.drop(1).join(" ")}											

end

get_thoses_fucking_name

################################################################################################################################################################################################################
######################## 		Création d'une méthode pour prendre tous les mails sauf sur certaines adresses mails et stocker dans un fucking array	########################################################
################################################################################################################################################################################################################

def get_bitches_mail
	
	mail = []

    page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576'))	
    page.css('a[@href ^="mailto:"]').each do |email|
    
    mail << email.text.sub(" ", "")

end

  mail.keep_if { |w| w =~ /assemblee-nationale.fr$/ }
  mail.delete_if {|w| w =~ /secretariat-blanchet/}
  mail.delete_if {|w| w =~ /bureau-m-orphelin/}

  return mail

end

get_bitches_mail

################################################################################################################################################################################################################
######################## 										puts thoses fuckings deputies names and mails in a hash 								########################################################
################################################################################################################################################################################################################

def create_hash
 
 	hash = Hash[get_thoses_fucking_name.zip(get_bitches_mail)]
 	
 	hash.each do |key, mail|

	puts ":nom => #{key} ; :e-mail => #{mail}"
	
	end
end

create_hash