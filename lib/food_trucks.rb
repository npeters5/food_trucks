require 'soda/client'
require 'table_print'
require 'io/console'

class FoodTruckAPIWrapper

  BASE_URI = 'https://data.sfgov.org/resource/bbb8-hzi6.json'
  TOKEN = 'uqHjV219ofMW46BXgfxHY4iyj'

  def initialize
    @trucks = []
    @offset = 0
    @now = Time.new
  end

  def run
    start
    while continue?
      @offset += 10
      get_trucks
    end
  end

  def get_trucks
    client = SODA::Client.new({:domain => "data.sfgov.org", :app_token => TOKEN})
    @trucks = client.get("#{BASE_URI}?$where=start24 < '#{@now.hour}:#{@now.min}' AND end24 > '#{@now.hour}:#{@now.min}' AND dayorder = #{@now.wday}&$order=applicant")
    puts
    tp @trucks[@offset..@offset + 9], {'applicant' => {:display_name => 'NAME', :width => 100}}, {'location' => {:display_name => 'ADDRESS'}}
    puts
  end

  private

  def start
    puts "Greetings! Please press any key to see food trucks that are open right now.\n"
    STDIN.getch
    get_trucks
  end

  def continue?
    if @offset + 10 < @trucks.length
      puts "Press the 'm' key then ENTER to see more results\n"
      continue = gets.chomp
      continue.downcase == "m" ? true : false
    else
      puts "There are no more results.\n\n"
      false
    end
  end

end
