class StringUtils
  def wavefy(string)
    result = ""
    string.each_char.with_index do |char, index|
      if index.even?
        result += char.downcase
      else
        result += char.upcase
      end
    end
    result
  end
end