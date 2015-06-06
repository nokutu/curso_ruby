require_relative "puntoSuministro"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_simple
    punto = PuntoDeSuministro.new({:tarifa => 2.0, :potencia => 10})
    assert_equal(101, punto.facturar(10,10))
  end
end
