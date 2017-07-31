class HomeController < ApplicationController
  def top
      require 'json'
      require 'uri'
      require 'net/http'
      require 'csv'
      
      uri = URI.parse('https://data.nasa.gov/resource/tfkf-kniw.json')
      json = Net::HTTP.get(uri)
      @result = JSON.parse(json)
      
      @array = Array.new
      
      #ポイントは、<%= @hash.to_json.html_safe %>をapplication.html.erbに記入
      
      
      puts "-------start--------"
      a = 1
      @result.each do |i|
          puts a
          puts "発生日時：" + i["date"].to_s #発生日時
          puts "国名：" + i["countryname"].to_s #国名
          puts  "緯度：" + i ["geolocation"]["coordinates"][1].to_s #緯度
          puts  "経度：" + i ["geolocation"]["coordinates"][0].to_s #経度
          puts  "人口：" + i ["population"].to_s #規模
          puts  "地滑りの規模：" + i ["landslide_size"].to_s
          puts  "死亡者数：" + i ["fatalities"].to_s #死亡者数
          puts  "負傷者数：" + i ["injuries"].to_s #負傷者数
          
          
          @array.push(date:i["date"].to_date,country:i["countryname"],lat:i["geolocation"]["coordinates"][1],lng:i["geolocation"]["coordinates"][0],magnitude:i["landslide_size"],fatalities:i["fatalities"],injuryies:i["injuries"])
          
          a = a +  1
          
          puts "-------------------"
      end
      puts "-------end---------"
      
      puts @array
      
      puts "------@hash---------"
      

  end
end
