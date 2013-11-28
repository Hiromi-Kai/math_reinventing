require './newtons_method'


describe 'ニュートン法テスト' do

  it 'x**3+x-1は0.682付近で解をとる' do
    nm=NewtonsMethod.new(->(x){x**3+x-1},->(x){3*x**2+1},0.000001)
    nm.main_logic(1).should be_within(0.000001).of(0.682)
  end
  it '(x-1)*(x+5)は1付近で解をとる' do
    nm=NewtonsMethod.new(->(x){(x-1)*(x+5)},->(x){2*x+4},0.000001)
    nm.main_logic(10).should be_within(0.000001).of(1)
  end
end
