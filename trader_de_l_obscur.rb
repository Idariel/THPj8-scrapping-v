Lehman Brothers, impressionné par tes algorithmes de trading de la dernière fois, veut faire encore appel à toi. Leur Chief Digital Officer, très hype, a entendu parler au JT de TF1 d'un "truc révolutionnaire qui s'appelle je crois le bloque chienne" et voudrait du coup cnnaître le cours des cryptomonnaies.

Va sur CoinMarketCap et fait un programme qui va récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs.

BONUS : fais en sorte que ton programme tourne en boucle, et prenne lex taux toutes les heures

require 'rubygems'
require 'nokogiri'
require 'open-uri'

coinmarketcap = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(coinmarketcap))

puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage


def get_cryptomoney_exchange_rate

end
