require 'pry'
module NewsCLI
  class CLI
    def start
      API.api_public_key
      puts "Welcome to the News CLI!"
      menu
      @input = "query"
  
      while @input != "exit" && @input != "quit" && @input != "q"
        Article.clear
        article_search
        article_navigator
      end
      puts "Thank you for using the News CLI!"
    end

    def menu
      puts <<-QUERY
        ============================================
        Please enter a search query
        To start a new query at any time, type query
        To leave, type exit or quit at any time
        ============================================
      QUERY
    end

    def article_search
      @input = gets.chomp
      Article.search(@input) unless @input == "exit"
      Article.all.each.with_index(1) do |art, index|
        puts "#{index}. #{art.title}"
      end
    end

    def article_navigator
      while @input != "exit" && @input != "query"
        puts "Choose a number"
        @input = gets.chomp
        index = @input.to_i - 1
        if index > 9
          puts "Wrong input, try again"
        else  
          break if index < 0
          selected_article = Article.all[index]
          puts "Title: #{selected_article.title}"
          puts "Description: #{selected_article.description}"
          puts "URL: #{selected_article.url}"
        end
      end
    end
  end
end