#encodings: utf-8
puts "Qué hora es?"

num = /[0-9]/i
hour = gets


unless num === hour
    puts "Escribe solo números"
    exit
end

hour = hour.to_i
case hour    
	when 6..12 then puts "Buenos días!"
	when 12..22 then puts "Buenas tardes!"
    when 22..23 then puts "Buenas noches!"
    when 0..6 then puts "Buenas noches!"
    else puts "No te he entendido :("
end
