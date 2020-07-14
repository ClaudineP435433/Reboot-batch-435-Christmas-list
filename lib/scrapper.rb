require 'open-uri'
require 'nokogiri'

def scrap(keyword)
  ideas = []
  url = "https://www.etsy.com/search?q=#{keyword}"
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  # doc.search('.v2-listing-card__info')
  # => Liste de mes cartes rouges

  doc.search('.v2-listing-card__info').first(5).each do |element|
    name = element.search('h3').text.strip
    price = element.search('.currency-value').text.strip.to_i
    idea_gift = {
      name: name,
      price: price,
      bought: false
    }
    ideas << idea_gift
  end
  return ideas
end

p scrap("socks")
