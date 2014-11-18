# https://projecteuler.net/problem=79

$passcodes = []
$chars = {}
$result = []

File.readlines("pc.txt").map do |line|
  line.chomp!
  $passcodes << line.split("")
end

def addNumberToKey(key, num)
  arr = $chars[key] ? $chars[key] : []
  arr << num if !arr.include?(num) 
  $chars[key] = arr
end

def switch(key, array) 
  array.each do |i|
    if ($result.index(key) > $result.index(i))
      bigIndex = $result.index(key)
      smallIndex = $result.index(i)
      $result[smallIndex] = key
      $result[bigIndex] = i
    end
  end
end

$passcodes.each do |p|
  addNumberToKey(p[0], p[1])
  addNumberToKey(p[0], p[2])
  addNumberToKey(p[1], p[2])
end

$chars = Hash[$chars.sort_by{|k,v| -v.length}] 

$result = [$chars.keys[0]]
$chars.values[0].each do |i|
  $result << i
end

$chars.each { |k, v| switch(k, v) }

p $result