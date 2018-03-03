class Bowling
  attr_accessor :score

  def initialize
    @score = 0
    @gameRolls = []
  end

  def hit(pins_count)
    @gameRolls.push(pins_count)
  end

  def giveMeTheScore
    (0..9).each do |indexFrame|
      if isSpare?(indexFrame)
        addSpareBonusToScore(indexFrame)
      elsif isStrike?(indexFrame)
        addStrikeBonusToScore(indexFrame)
      end
      addFrameScore(indexFrame)
      p @score
    end
    return @score
  end

  private
  def addStrikeBonusToScore(indexFrame)
    nextFrame = indexFrame + 1
    secondNextFrame = indexFrame + 2
    if isStrike?(nextFrame) and isStrike?(secondNextFrame)
      @score += 20
    elsif isStrike?(nextFrame)
      @score += 10 + @gameRolls[2 * secondNextFrame]
    else
      @score += @gameRolls[2 * nextFrame] + @gameRolls[2 * nextFrame + 1]
    end
  end

  def addFrameScore(indexFrame)
    @score += @gameRolls[2 * indexFrame] + @gameRolls[2 * indexFrame + 1]
  end

  def addSpareBonusToScore(indexFrame)
    @score += @gameRolls[2 * (indexFrame + 1)]
  end

  def isSpare?(indexFrame)
    if @gameRolls[2 * indexFrame] == 10
      return false
    end
    return (@gameRolls[2 * indexFrame] + @gameRolls[2 * indexFrame + 1]) == 10
  end

  def isStrike?(indexFrame)
    return @gameRolls[2 * indexFrame] == 10
  end
end