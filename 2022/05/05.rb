def read
  data, commands = File.read('input').split("\n\n")
  data = data.split("\n")[0..-2].
           map { |el| el.scan(/..../) }.transpose.
           map { |el| el.map { |el| el.scan(/\w/) }.delete_if(&:empty?).flatten.reverse }
  commands = commands.split("\n").map { |el| el.split.map(&:to_i).select { |el| el > 0 } }.
               map { |n, m, k| [n, m-1, k-1] }
  [data, commands]
end

data, commands = *read
commands.each do |num, from, to|
  # This is less efficient than a commented out code, but it
  # implements the same logic as a factor program:
  # data[to] = data[to] + data[from].last(num).reverse
  # data[from] = data[from][..-num-1]  
  num.times do
    data[to].push(data[from].pop)
  end
end

puts data.map(&:last).join  # => JCMHLVGMG

data, commands = *read
commands.each do |num, from, to|
  data[to] = data[to] + data[from].last(num)
  data[from] = data[from][..-num-1]
end

puts data.map(&:last).join  # => LVMRWSSPZ
