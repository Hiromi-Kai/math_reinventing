require './bisection_method'


describe '2分法テスト' do

  it '(x-3)*(x+2)は3付近で解をとる' do
    bm=BisectionMethod.new(->(x){(x-3)*(x+2)},0.001)
    bm.main_logic(0,10).should be_within(0.001).of(3)
  end
  it '(x-1)*(x+5)は1付近で解をとる' do
    bm=BisectionMethod.new(->(x){(x-1)*(x+5)},0.001)
    bm.main_logic(0,10).should be_within(0.001).of(1)
  end
end