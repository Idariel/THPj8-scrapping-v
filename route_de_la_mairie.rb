require 'rubygems'
require 'nokogiri'
require 'open-uri'
# marc

def mairies_du_95
  town_hash = {name:'',url:'',email:''}

  def get_town_name
    townhalls = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    names = townhalls.css('a')
    names.each do |name|
    # town_hash[:name] = name
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
      puts ("http://annuaire-des-mairies.com/"+new_link)
      return name:name
    end

  end

  get_town_name()
  # get_all_the_urls_of_val_doise_townhalls()
  # get_the_email_of_a_townhal_from_its_webpage()
  puts town

end
mairies_du_95()
