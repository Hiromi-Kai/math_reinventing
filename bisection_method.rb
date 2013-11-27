
module BisectionMethod
  EPS=0.001
  class <<self
    def func(x)
      x**3+x-1
    end
    def main_logic(a,b)
      loop do
        c=((a+b).to_f/2)
        if func(c)*a<0
          b=c
        else
          a=c
        end
        return c if (a-b).abs < EPS
      end
    end
  end
end

p BisectionMethod.main_logic(0,1)