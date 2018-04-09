class TakskController < ApplicationController
  def index; end

  def answer
    @a_value = (buf = params[:n].to_i) ? buf : 0
    @new = Array.new
    @new = check_friend(@a_value)
    format_answer(@new)
  end
  def check_friend(n)
    s=Array.new
    v=Array.new
    m=Array.new
    (2..n).each { |x| s.push([x,(1..x/2).select{|i| m<<i if (x % i).zero?}.inject(:+)]) }
    b=s.each { |x| x.reverse! }
    s.each {|y| b.each {|z| v.push(y) if y[1]==z[0]&&y[0]==z[1]&&y[0]!=z[0]&&y[1]>y[0]}}
    return v
  end
  def format_answer(result)
    k=1
    date = result.map { |elem| k += 1; { number: elem, quantity: k } }
    respond_to do |format|
      format.xml do
        render xml: date.to_xml
      end
      format.rss { render xml: date.to_xml }
    end
  end
end
