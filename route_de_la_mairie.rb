require 'rubygems'
require 'nokogiri'
require 'open-uri'

def mairies_du_95

  def get_town_name
    townhalls = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    names = townhalls.css('.lientxt')
    names.each do |name|
      town_hash = { } #, :email=> email.text, :url=> url
      town_hash[:town_name] = name.text
    end
  end

  def get_the_email_of_a_townhal_from_its_webpage
    vaureal = "http://annuaire-des-mairies.com/95/vaureal.html"
    page = Nokogiri::HTML(open(vaureal))

    mail = page.css('td font')
    mail.each do |email|
      if email.text.include?('@')
        puts email.text
      end
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
  # get_the_email_of_a_townhal_from_its_webpage()
  get_town_name()

end
mairies_du_95()
