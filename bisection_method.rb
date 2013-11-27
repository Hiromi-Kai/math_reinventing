# coding:utf-8
#二分法
class BisectionMethod
  def initialize(func,eps=0.001)
    @eps=eps
    set_function(func)
  end
  def set_function(func)
    @func=func
  end
  def main_logic(a,b)
    loop do
      c=((a+b).to_f/2)
      if @func.call(c)*@func.call(a)<0
        b=c
      else
        a=c
      end
      return c if (a-b).abs < @eps
    end
  end
end
bm=BisectionMethod.new(->(x){x**3+x-1})
p bm.main_logic(0,1)