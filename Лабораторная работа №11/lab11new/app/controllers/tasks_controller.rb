class TasksController < ApplicationController
  before_action :parse_params, only: :output
  def input; end

  def parse_params
    @n = params[:n].to_i
  end

  def add_record_table
    res = Friend.create friend_numb:@friend_numb, quantity: @quantity
    @result << ActiveSupport::JSON.decode(res.friend_numb)
    @result << ActiveSupport::JSON.decode(res.quantity.to_s)
    res.save
  end

  def output
    @result = []
    if (res = Friend.find_by_friend_numb_and_quantity( @friend_numb, @quantity))
      @result << ActiveSupport::JSON.decode(res.friend_numb)
      @result << ActiveSupport::JSON.decode(res.quantity)
    else
      check_friend(@n)
      add_record_table
    end
  end

  def results
    @result = Friend.all
    render xml: @result
  end

  def check_friend(n)
    @friend_numb=[]
    b = (2..n).map { |x| [x,(1..x/2).select{|i| (x % i).zero?}.inject(:+)]}
    s = b.map {|x| x.reverse}
    @friend_numb=b.map{|y| s.select{|z| z==y&&z[0]<z[1]}.flatten}.select{|x| x!=[]}
    @quantity=@friend_numb.size
  end

  def to_clean_bd
    Friend.destroy_all
    redirect_to clean.erb
  end
end
