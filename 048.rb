# https://projecteuler.net/problem=48

def raise(a, b, m)
  if b == 1
    a
  elsif b.even?
    c = raise(a, b/2, m)
    c*c % m
  else
    c = raise(a, b/2, m)
    c*c*a % m
  end
end

sum = 0
1.upto(20000) do |n|
  sum = (sum + raise(n, n, 10000000000)) % 10000000000
end

puts sum