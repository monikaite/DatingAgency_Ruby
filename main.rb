
require_relative 'single.rb'
require_relative 'dating_agency.rb'

dating_agency = DatingAgency.new

IO.foreach('singles.txt') do |line|
  data = line.split
  gender = data[0]
  name = data[1]
  desirability = data[2].to_i
  sought_desirability = data[3].to_i
  hobbies = Array[data[4], data[5], data[6]]
  dating_agency.add_single(Single.new(gender, name, desirability, sought_desirability, hobbies))
end

dating_agency.match
puts dating_agency.to_s