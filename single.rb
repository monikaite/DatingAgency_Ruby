
class Single
  attr_reader :gender, :name, :desirability, :sought_desirability, :hobbies, :fussiness

  def initialize(gender, name, desirability, sought_desirability, hobbies)
    @gender, @name, @desirability, @sought_desirability, @hobbies= gender, name, desirability, sought_desirability, hobbies
    @fussiness = sought_desirability - desirability
  end

  def match?(other, avg_desirability_other_singles)
    other.desirability >= @sought_desirability || other.desirability > avg_desirability_other_singles
  end

  def to_s
    "#{@name}, #{@desirability}, #{@sought_desirability}, #{@fussiness}"
  end
end