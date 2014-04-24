# coding:utf-8
require './simpson.rb'

describe 'シンプソンズ法テスト' do
  it 'y=x**2の解は2.333..' do
    sm=SimpsonMethod.new(->(x){x**2},(1..2),10)
    sm.get_integral_answer.should be_within(0.000000001).of(7.0/3.0)
  end
end
