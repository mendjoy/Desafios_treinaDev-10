class Chars
  def unique_quantity(text)
    text.split(' ').map { |word| word.chars.uniq.length }.sum
  end
end
