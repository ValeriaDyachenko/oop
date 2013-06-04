class Order
  
  def initialize (name, order_date, issue_date, book_name)
    @@orders ||= []
    @@orders << [name, order_date, issue_date, book_name]
  end
   
  #the smallest period for which library found a book 
    def self.min_period 
      array_min_period = []
      @@orders.map do |item|
        if item[2] != nil and item[1] != nil
          min_p = item[2] - item[1]
          array_min_period.push(min_p)
        end
      end
      
      puts "Task #1: 
          #{((array_min_period.min) / 86400).to_i} days the smallest period for which library found a book
          "
    end
     
  
  #how many orders were not satisfied
    def self.counter
      counter = 0
      @@orders.map do  |item|
        if item[2].nil? 
          counter += 1
        end
      end
     
      puts "Task #2: 
          #{counter} orders were not satisfied
          "
  end
  
  #who often takes the book 
    def self.pop_reader(book) 
      reader = Hash.new(0)
      @@orders.each { |item| reader[item[0]] += 1 if item[3] == book}
      pop_reader = reader.max_by{ |key, value| value }
     
      puts "Task #3: 
          #{pop_reader.last} reader often takes the book ##{book}
          "
    end
  
  #what is the most popular book
    def self.pop_book
      books_counter = Hash.new(0)
      @@orders.each { |item| books_counter[item[3]] += 1 }
      pop_book = books_counter.max_by{ |key, value| value }
      
      puts "Task #4: 
          #{ pop_book.first } is the most popular book 
          "
    end
  
  #how many people ordered one of the three most popular books
    def self.counter_reader
      books_counter = Hash.new(0)
      @@orders.each { |item| books_counter[item[3]] += 1 }
      popular_books = books_counter.sort_by{ |key, value| value }.reverse
      first = popular_books[0]
      second = popular_books[1]
      third = popular_books[2]
      
      puts "Task #5:
          #{first.last} people ordered #{first.first} book
          #{second.last} people ordered #{second.first} book
          #{third.last} people ordered #{third.first} book"
    end
    
end


Order.new("1", Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 12),"1")
Order.new("2", Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 11),"2")
Order.new("3",Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 12),"3")
Order.new("4",Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 14),"2")
Order.new("4",Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 16),"4")
Order.new("1",Time.mktime(2013, 5, 9), nil,"4")
Order.new("1",Time.mktime(2013, 5, 9), nil,"1")
Order.new("5",Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 19),"1")
Order.new("4",Time.mktime(2013, 5, 9), Time.mktime(2013, 5, 18),"1")
Order.new("2",Time.mktime(2013, 5, 9), nil,"1")

Order.min_period
Order.counter
Order.pop_reader("1")
Order.pop_book
Order.counter_reader
