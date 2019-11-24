module Luhn
  def self.is_valid?(number)
    every_other = 1
    sum_all = 0
    number_array = number.to_s.split("")
    odd_even = number_array.length % 2 == 0 ? "even" : "odd"

    number_array.each.with_index do |num, index|
      every_other == 1 && odd_even == "even" ? 
        number_array[index] = number_array[index].to_i * 2 
        : num
      number_array[index].to_i >= 10 && odd_even == "even" ? 
        number_array[index] = number_array[index].to_i - 9 
        : num

      every_other == 1 && odd_even == "odd" ? 
        number_array[-(index + 1)] = number_array[-(index + 1)].to_i * 2
        : num
      number_array[-(index + 1)].to_i >= 10 && odd_even == "odd" ? 
        number_array[-(index + 1)] = number_array[-(index + 1)].to_i - 9 
        : num

      every_other *= -1
      sum_all += odd_even == "even" ? number_array[index].to_i : number_array[-(index + 1)].to_i
    end

    puts "\nSum of all = #{sum_all} \n" 
    sum_all % 10 == 0 ? true : false
  end
end