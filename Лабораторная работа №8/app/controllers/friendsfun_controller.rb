class FriendsfunController < ApplicationController

def input
end

def view
@a_value = params[:a].to_i
@new = check_friend(@a_value)
end

def check_friend(n)
b = (2..n).map { |x| [x,(1..x/2).select{|i| (x % i).zero?}.inject(:+)]}
s = b.map {|x| x.reverse}
b.map{|y| s.select{|z| z==y&&z[0]<z[1]}.flatten}.select{|x| x!=[]}
end
end
