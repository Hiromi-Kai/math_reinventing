# coding:utf-8
#二分法
class BisectionMethod
  def initialize(func,eps=0.001)
    @eps=eps
    set_function(func)
  end
  #導出対象となる関数をラムダ式で代入する
  def set_function(func)
    @func=func
  end
  #足して2で割る
  def get_bisection(a,b)
    (a+b).to_f/2
  end
  #方程式f(x)のf(num1)*f(num2)が負を示すか否か
  def is_minus_product?(num1,num2)
    @func.call(num1)*@func.call(num2)<0
  end
  #解の誤差にまで値が近づいたかどうか
  def is_convergence?(a,b)
    (a-b).abs < @eps
  end
  def main_logic(a,b)
    loop do
      c=get_bisection(a,b)
      b=c if is_minus_product?(a,c)
      a=c if is_minus_product?(b,c)
      return c if is_convergence?(a,b)
    end
  end
end
