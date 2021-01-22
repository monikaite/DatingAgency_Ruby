
require_relative 'single.rb'
require_relative 'couple.rb'
require_relative 'date.rb'

class DatingAgency
  def initialize
    @singles = []
    @couples = []
  end

  def add_single(single)
    @singles << single
    @singles.sort_by! {|person| [person.fussiness]}
  end

  def match
    i = 0
    while i < @singles.size/2
      single1 = @singles[i]
      single2 = @singles[-i-1]

      date = Date.new(single1, single2)

      j = aga_compatible(single1, single2)
      k = zin_compatible(single1, single2)

      if j || k
        if date.match?(avg_desirability_other_singles(single1, single2))
          create_new_couple(i, -i-1)
        else
          i += 1 # no need to increment i if a couple is created
        end
      else
        i += 1
      end
    end
  end

  def to_s
    str = "Couples:\n"
    @couples.each do |couple|
      str += couple.to_s + "\n"
    end
    str +=  "Singles:\n"
    @singles.each do |single|
      str += single.name + "\n"
    end
    str
  end

  private

  def aga_compatible(first, second)
    if first.gender == "a" || second.gender == "a"
      if (first.hobbies & second.hobbies).length != 0
        return true
      end
    else
      return false
    end
  end

  def zin_compatible(first, second)
    if (first.gender == "z" && second.gender == "a") || (first.gender == "a" && second.gender == "z")
      return true
    elsif first.gender == "z" && second.gender == "z"
      return false
    else
      return false
    end
  end

  def create_new_couple(index1, index2)
    @couples << Couple.new(@singles[index1], @singles[index2])
    @singles.delete_at(index1)
    @singles.delete_at(index2)
  end

  def avg_desirability_other_singles(ignore_single1, ignore_single2)
    total_desirability = 0
    @singles.each do |single|
      if !single.equal?(ignore_single1) && !single.equal?(ignore_single2)
        total_desirability += single.desirability
      end
    end
    (@singles.size-2) > 0 ? total_desirability / (@singles.size-2).to_f : 0.0
  end
end