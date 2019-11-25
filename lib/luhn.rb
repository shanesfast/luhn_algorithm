module Luhn
  def self.is_valid?(number)
    every_other = 1
    sum_all = 0
    number_array = number.to_s.split("")

    number_array.each.with_index do |num, index|
      every_other == -1 ? 
        number_array[-(index + 1)] = number_array[-(index + 1)].to_i * 2
        : num
      number_array[-(index + 1)].to_i >= 10 ? 
        number_array[-(index + 1)] = number_array[-(index + 1)].to_i - 9 
        : num

      every_other *= -1
      sum_all += number_array[-(index + 1)].to_i
    end

    puts "\nSum of all = #{sum_all} \n" 
    sum_all % 10 == 0 ? true : false
  end
end