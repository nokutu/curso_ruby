#encoding: utf-8

puts "Escribe un texto:"
text = gets

text.reverse.each_char do |char|
    puts char
end
