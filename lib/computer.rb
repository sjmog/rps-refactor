class Computer
  attr_reader :shape

  def play(computer_shape=random_shape)
    @shape = computer_shape
  end

  def result_against(opponent_shape)
    if opponent_shape == :rock
      if shape == :rock
        return :draw
      elsif shape == :paper
        return :win
      elsif shape == :scissors
        return :lose
      end     
    elsif opponent_shape == :paper
      if shape == :rock
        return :lose
      elsif shape == :paper
        return :draw
      elsif shape == :scissors
        return :win
      end   
    elsif opponent_shape == :scissors
      if shape == :rock
        return :win
      elsif shape == :paper
        return :lose
      elsif shape == :scissors
        return :draw
      end   
    else
      raise "choice given is not in game rules"
    end
  end

  def random_shape
    [:rock, :paper, :scissors].sample
  end
end