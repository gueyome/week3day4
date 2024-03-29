require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_url(url)
    url1=Nokogiri::HTML(open(url))
    url_list = []
    url1.xpath('//*[@class="lientxt"]').each do |node|
        url_list << node["href"]
    end
    print url_list
    return url_list
end

def tranform_full_url(array_cities)
    array_cities.each do |city|
        city.delete_prefix!(".")
        city.insert(0,'http://annuaire-des-mairies.com')
    end
    print array_cities
    return array_cities
end


def get_townhall_email(url)
    url1 = Nokogiri::HTML(open(url))
    email = url1.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    print email
    return email
end

def get_all_emails(url)
    all_urls = tranform_full_url(get_townhall_url(url))
    emails = []
    for i in (0..all_urls.size-1)
        emails << get_townhall_email(all_urls[i])
    end
    print emails
    return emails
end
    

def get_townhall_cities(url)
    url1 = Nokogiri::HTML(open(url))
    cities_list = []
    url1.xpath('//*[@class="lientxt"]').each do |node|
        cities_list << node.text
    end
    print cities_list
    return cities_list
end

def join_my_two_arrays(array1,array2)
    array_final=[]
    for i in (0..array1.size-1) do
        array_final << { array1[i] => array2[i]}
    end
    print array_final
    return array_final
end


#get_all_emails(url)
join_my_two_arrays(get_townhall_cities(url),get_all_emails(url))
