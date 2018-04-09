class InputController < ApplicationController
  def index
    render layout: false
  end

  def answer
    a_value = params[:n].to_i
    p a_value
    @new = check_friend(a_value)
    respond_to do |format|
      format.html
      format.json do
        render json:
                   {type: @new.class.to_s, value: @new}
      end
    end
  end

  def check_friend(n)
    b = (2..n).map { |x| [x,(1..x/2).select{|i| (x % i).zero?}.inject(:+)]}
    s = b.map {|x| x.reverse}
    b.map{|y| s.select{|z| z==y&&z[0]<z[1]}.flatten}.select{|x| x!=[]}
  end
#  def addRow(st)
#    str=String.new
#    st.each{|x| str+='<tr><td>'+ x[0].to_s + '</td><td>' + x[1].to_s + '</td></tr>'}
#    str
#  end
end
