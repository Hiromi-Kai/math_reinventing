# coding:utf-8
#ニュートン法

class NewtonsMethod
  def initialize(func,derived_func,eps=0.001)
    @eps=eps
    @func=func
    @derived_func=derived_func
    @approximations=[]
  end
  attr_reader :approximations
  #近似値導出
  def get_approximation(num)
    num-@func.call(num).to_f/@derived_func.call(num).to_f
  end
  #解の誤差にまで値が近づいたかどうか
  def is_convergence?(a,b)
    (a-b).abs < @eps
  end
  def main_logic(num)
    loop do
      @approximations << (approximation=get_approximation(num))
      unless is_convergence?(num,approximation)
        num=approximation 
      else
        return approximation
      end
    end
  end
end
