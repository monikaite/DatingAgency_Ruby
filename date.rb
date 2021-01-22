
class Date
  def initialize(single1, single2)
    @single1, @single2 = single1, single2
  end

  def match?(avg_desirability_other_singles)
    @single1.match?(@single2, avg_desirability_other_singles) &&
    @single2.match?(@single1, avg_desirability_other_singles)
  end
end