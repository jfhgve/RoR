class TasksController < ApplicationController
  def input
  end

  def output
    @friend_num = []
    n = params[:n].to_i
      b = (2..n).map { |x| [x,(1..x/2).select{|i| (x % i).zero?}.inject(:+)]}
      s = b.map {|x| x.reverse}
    @friend_num=b.map{|y| s.select{|z| z==y&&z[0]<z[1]}.flatten}.select{|x| x!=[]}
    @quantity = @friend_num.size
    end
end
