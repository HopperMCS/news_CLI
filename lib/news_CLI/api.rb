require 'json'
require 'pry'
require 'open-uri'
require 'erb'
module NewsCLI
  class API
    def self.api_public_key 
      begin
        @@public = File.open(File.expand_path("~/.newsfeed_key")).read.strip
      rescue 
        puts "No public key found. Please follow the instructions at https://newsapi.org to get your keys."

        # create public key
        puts "Please enter your public key:"
        @@public = gets.strip 
        return if @@public == "exit"
        File.open(File.expand_path("~/.newsfeed_key"), "w") do |file|
          file.print @@public
        end
      end
      @@public
    end

    def self.search_by_query(query)
      query_f = ERB::Util.url_encode("#{query}")
      url = "https://newsapi.org/v2/everything?qInTitle=#{query_f}&pageSize=10&page=1&apiKey=#{self.api_public_key}"
      req = URI.open(url)
      response_body = req.read
      json = JSON.parse(response_body)
    end

    def self.get_headlines(query)
      data = self.search_by_query(query)
      data["articles"]
    end
  end
end

