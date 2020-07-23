require "pry"
module NewsCLI
  class Article
    attr_accessor :title, :description, :url

    @@all = []

    def initialize(attributes)
      @title = attributes["title"]
      @description = attributes["description"]
      @url = attributes["url"]
    end

    def self.search(query)
      @@all = API.get_headlines(query).map do |article_hash|
        self.new(article_hash)             
      end
    end

    def self.sort(query)
      @@all.sort_by(&:title)
    end

    def self.clear
      @@all.clear
    end

    def self.all
      @@all
    end
  end
end