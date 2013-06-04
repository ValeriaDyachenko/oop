class Mail_sorting 
  
  def initialize (city, street, house, apartment, destination, value)
    @@sorting ||= []
    @@sorting << [city, street, house, apartment, destination, value]
  end
  
  #the number of parcels sent to some city 
    def self.counter_parcels(city)
      counter_parcels = 0
      @@sorting.map do  |item|
        if item[0] == city 
          counter_parcels += 1
        end
      end
      
      puts "Task #1:  
          #{counter_parcels} parcels sent to Pershotravensk
      "
    end

  #how many parcels with value higher than 10 were sent 
    def self.counter_parcels_value_higher_10
      counter_parcels = 0
      @@sorting.map do  |item|
        if item[5].to_i > 10
          counter_parcels += 1
        end
      end
        
      puts "Task #2:
          #{counter_parcels} parcels with value higher than 10 were sent 
          "
    end
  
  #what is the most popular address
    def self.pop_address
      address_counter = Hash.new(0)
      @@sorting.map { |item| address_counter [[item[0],item[1],item[2],item[3]]] += 1 }
      pop_address = address_counter.max_by{ |key, value| value }
      result = pop_address.first
     
      puts "Task #3:
          #{result[0]} #{result[1]} #{result[2]}/#{result[3]} is the most popular address "
    end
  
end
  
  
  
Mail_sorting.new("Dnepr","Gagarin Str.","57","615","Elena","4")
Mail_sorting.new("Pershotravensk","Gorkiy Str.","18","58","Evgeniy","15")
Mail_sorting.new("Pershotravensk","Gagarin Str.","14","58","Evgeniy","8")
Mail_sorting.new("Dnepr","Gagarin Str.","57","826","Sashko","10")
Mail_sorting.new("Pershotravensk","Gorkiy Str.","18","58","Nataliya","20")


Mail_sorting.counter_parcels("Pershotravensk")
Mail_sorting.counter_parcels_value_higher_10
Mail_sorting.pop_address
