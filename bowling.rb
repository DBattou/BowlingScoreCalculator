class Bowling
  attr_accessor :score

  def initialize(rolls)
    @index = 0
    @score = 0
    rolls.each_char do
      calculateScore(rolls)
    end
  end

  def calculateScore(rolls)
    char = rolls[@index]
    prevChar = rolls[@index - 1]
    nextChar = rolls[@index + 1]
    nextChar2 = rolls[@index + 2]
    @index += 1
    if char == 'X'
      @score += 10
      if nextChar2 == '/'
        @score += 10
      elsif nextChar == 'X' && @index < 10
        @score += 10
        if nextChar2 == 'X' && @index < 10
          @score += 10
        else
          @score += nextChar2.to_i
        end
      else
        @score += nextChar.to_i + nextChar2.to_i
      end
    elsif char == '/'
      if nextChar == 'X'
        @score += 10
      end
      @score += 10 - prevChar.to_i + nextChar.to_i
    else
      @score += char.to_i
    end
  end
end
