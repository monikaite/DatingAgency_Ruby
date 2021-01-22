
require_relative 'single.rb'

class Couple
  def initialize(single1, single2)
    @single1, @single2 = single1, single2
  end

  def to_s
    "(#{@single1.name}, #{@single2.name})"
  end
end