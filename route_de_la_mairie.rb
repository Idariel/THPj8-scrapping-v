require 'rubygems'
require 'nokogiri'
require 'open-uri'

def mairies_du_95

  def get_the_email_of_a_townhal_from_its_webpage
    townhalls = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    names = townhalls.css('.lientxt')
    town_hash = { } #, :email=> email.text, :url=> url
    names.each do |name|
      town_hash[:town_name] = name.text
    end

    # ville = town_hash[:town_name].gsub " ", "-" #remplace les espaces par des tirets (pour l'url)
    # puts ville
    # villed = ville.downcase #mise en minuscule
    # puts villed
    townhall_url = "http://annuaire-des-mairies.com/95/"+ville+".html" #bad URI
    page = Nokogiri::HTML(open(townhall_url))

    mail = page.css('td font')
    mail.each do |email|
      if email.text.include?('@')
        puts email.text
      end

    # # Exemple avec Vaureal
    # townhall_url = "http://annuaire-des-mairies.com/95/vaureal.html"
    # #bad URI : dans les noms de ville avec espace, les espaces devraient devenir des tirets
    # page = Nokogiri::HTML(open(townhall_url))
    #
    # mail = page.css('td font')
    # mail.each do |email|
    #   if email.text.include?('@')
    #     puts email.text
    #   end

    end
  end

  def get_all_the_urls_of_val_doise_townhalls
    townhalls = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = townhalls.css('.lientxt')
    links.each do |link|
      new_link = link['href']
      new_link[0] = ''
      new_link[0] = ''
      url = "http://annuaire-des-mairies.com/"+new_link
      puts (url)
    end

  end

  # get_all_the_urls_of_val_doise_townhalls()
  get_the_email_of_a_townhal_from_its_webpage()
end

mairies_du_95()
