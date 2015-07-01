class Mynumber

  #set constants
  ONES = %w(one two three four five six seven eight nine)
  TENS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  TEENS = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  # initialize Mynumber class with an integer between 0 and 9999
  def initialize(num)
    raise "please enter an integer" unless num.is_a? Integer
    raise "please enter a positive integer" if num < 0
    raise "please enter a number between 0 and 9999" if num > 9999
    @num = num
  end


  # create empty word array to store the number
  # add the numbers to a digits array and pad out empty values
  def number2word
    word = []
    if @num == 0
      word << 'zero'
    else
      digits = @num.to_s.chars.map(&:to_i)
      if digits.length < 4
        (4 - digits.length).times do
          digits.unshift 0
        end
      end
      word << thousands(digits[0]) << hundreds(digits[1]) << tens(digits[2],digits[3])
    end
    word.reject! { |w| w.empty? }
    word.join(' ')
  end

  def thousands(x)
    if x == 0
      ''
    else
      "#{ONES[x -1]} thousand"
    end
  end

  def hundreds(x)
    if x == 0
      ''
    else
      "#{ONES[x -1]} hundred"
    end
  end

  def tens(x,y)
    if x == 1 && y == 0
      "ten "
    elsif x == 0 && y == 0
      ""
    elsif y == 0
      "#{TENS[x -1]}"
    elsif x == 0
      "#{ONES[y -1]}"
    elsif x == 1 && y > 0
      "#{TEENS[y -1]}"
    else
      "#{TENS[x -1]} " + "#{ONES[y -1]}"
    end
  end

end
