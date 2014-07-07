# coding:utf-8
#シンプソンズ法

class SimpsonMethod
  def initialize(formula,integral_range,divide)
    set_formula(formula)
    set_integral_range(integral_range)
    set_divide(divide)
  end
  #積分対象の式
  def set_formula(formula)
    @formula=formula
  end
  #積分範囲
  def set_integral_range(range)
    @range=range
  end
  def set_divide(divide)
    @divide=divide
  end
  def get_range_start
    @range.first
  end
  def get_range_end
    @range.end
  end
  # y(x)
  def get_formula_answer(x)
    @formula.call(x)
  end
  #総和Σ
  def get_sigma(members,formula)
    members.map{|x|formula.call(x)}.inject(:+)
  end
  #微小区間のh
  def get_micro_height
    (b-a).to_f/@divide
  end
  def get_range_members
    (a*@divide..b*@divide).map{|f|f.to_f/@divide}
  end
  def get_even_range_members
    range=get_range_members
    range.select.with_index{|_,i|i%2==0 and i!=0 and i!=range.length-1}
  end
  def get_odd_range_members
    range=get_range_members
    range.select.with_index{|_,i|i%2!=0 and i!=0 and i!=range.length-1}
  end
  alias_method :y,:get_formula_answer
  alias_method :h,:get_micro_height
  alias_method :a,:get_range_start
  alias_method :b,:get_range_end
  public
  #課題：公式とプログラムで偶数要素、奇数要素がごちゃごちゃになっている
  def get_integral_answer
    h/3*(y(a)+y(b)+2*get_sigma(get_even_range_members,->(x){y(x)})+4*get_sigma(get_odd_range_members,->(x){y(x)}))
  end
end
