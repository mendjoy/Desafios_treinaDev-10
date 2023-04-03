class Finder
  def index_of(list, value)
    array = []
    list.each_with_index { |letter, index| array << index if letter.match(value)}
    array
  end
end
