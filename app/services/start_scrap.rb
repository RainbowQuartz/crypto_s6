require 'open-uri'
require 'nokogiri'

class StartScrap
  def initialize
    @crypto = {}
  end

  def self.perform
    @doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    p '-' * 20 + 'recherche des noms' + '-' * 20
    crypto_names = []
    @doc.xpath('//a[@class = "currency-name-container link-secondary"]').each{ |node| crypto_names << node.text }
    p '-' * 20 + 'recherche des valeurs' + '-' * 20
    crypto_values = []
    @doc.xpath('//a[@class = "price"]').each{ |node| crypto_values << node.text }
    p '-' * 20 + 'stockage dans un hash' + '-' * 20
    @crypto = Hash[crypto_names.zip(crypto_values)]
    #p @crypto
    p '-' * 20 + 'stockage dans le hash réussis' + '-' * 20
  end

  def save

  end
end
