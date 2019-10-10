require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www2.assemblee-nationale.fr/deputes/liste/tableau"

def get_deputy_url(url)
    url1=Nokogiri::HTML(open(url))
    url_list = []
    i = 1
    while i < 100 do
        url_list << url1.xpath("/html[1]/body[1]/div[1]/div[3]/div[1]/div[1]/section[1]/div[1]/article[1]/div[3]/div[1]/div[1]/table[1]/tbody[1]/tr[130]/td[1]/a[1]")
        i += 1
    end
    puts url_list
    return url_list
end

get_deputy_url(url)



#//body//tr[130] -- ligne
#//tr[130]//td[1] -- <article

#html[1]/body[1]/div[1]/div[3]/div[1]/div[1]/section[1]/div[1]/article[1]/div[3]/div[1]/div[1]/table[1]/tbody[1]/tr[130]
#html[1]/body[1]/div[1]/div[3]/div[1]/div[1]/section[1]/div[1]/article[1]/div[3]/div[1]/div[1]/table[1]/tbody[1]/tr[130]/td[1]/a[1]