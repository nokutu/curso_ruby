# encoding: UTF-8

require_relative "solitaire"
require "test/unit"

class TestSolitaire < Test::Unit::TestCase
    def test_chipher
        assert_equal((1..52).to_a + ["A", "B"], DEFAULT_DECK)
        assert_equal(["D"], solitaire(1, DEFAULT_DECK.dup))
        ciph = cipher("CODEI NRUBY LIVEL ONGER", DEFAULT_DECK.dup)
        assert_equal("GLNCQMJAFFFVOMBJIYCB", ciph)
        assert_equal("CODEINRUBYLIVELONGER", decipher(ciph , DEFAULT_DECK.dup))
    end
end
