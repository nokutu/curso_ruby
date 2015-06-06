require_relative "contador"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
    def setup
        @con = ContadorElectrico.new
    end

    def test_read_kwh
        @con.read_kwh(50)
        assert_equal(50, @con.lecture)
    end

    def test_read_maximeter
        @con.read_maximeter(25)
        assert_equal(25, @con.maximeter)
    end

    def test_get_last_reads
        @con.read_kwh(20)
        @con.read_kwh(50)
        @con.read_kwh(15)
        @con.read_kwh(20)
        @con.read_kwh(10)
        @con.read_kwh(35)
        assert_equal([0,20,70,85,105,115,150], @con.get_last_reads(7))
        assert_equal([0,20,70,85,105,115,150], @con.get_last_reads(15))
        assert_equal([115,150], @con.get_last_reads(2))
        assert_raise(ArgumentError) {@con.get_last_reads(-2)}
        assert_raise(ArgumentError) {@con.get_last_reads("a")}
    end
end
