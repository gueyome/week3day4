require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://coinmarketcap.com/all/views/all/"

#Extraction des devises et cours - METHODE 1
def take_value(url)
    url1=Nokogiri::HTML(open(url))
    a = []
    url1.xpath('//*[@class="price"]').each do |node|
        a << node.text
    end
    return a
end

def take_symbol(url)
    url1=Nokogiri::HTML(open(url))
    b =[]
    url1.xpath('//*[@class="text-left col-symbol"]').each do |node|
        b << node.text
    end
    return b
end

def join_my_two_arrays(array1,array2)
    array_final=[]
    for i in (0..array1.size-1) do
        array_final << { array1[i] => array2[i]}
    end
    return array_final
end

puts join_my_two_arrays(take_symbol(url),take_value(url))


#Extraction des devises et cours - METHODE 2 - navigation

#puts page.xpath('/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/div/table/tbody/tr[1]') 
# XPATH = /html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/div/table/tbody/tr[1]/td[3]
