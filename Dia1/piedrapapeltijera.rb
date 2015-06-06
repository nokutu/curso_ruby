def compare(opt1, opt2, values = {0 => "piedra", 1 => "papel", 2 => "tijeras"})
    case values.invert[opt1]-values.invert[opt2]
        when -2 then return -1
        when -1 then return 1
        when 0 then return 0
        when 1 then return -1
        when 2 then return 1
    end
end

score = 0,0
values = {0 => "piedra", 1 => "papel", 2 => "tijeras"}
while score[0] < 3 do
    puts "Piedra papel o tijeras?"
    optionHuman = gets.strip
    unless values.values.include?(optionHuman)
        puts "Opción incorrecta"
    else
        optionMachine = values[Random.new.rand(3)]
        puts "La máquina eligió #{optionMachine}"
        case compare(optionHuman, optionMachine)
            when -1 then puts "Ganaste"; score[0] += 1
            when 0 then puts "Empate"
            when 1 then puts "Perdiste"; score[1] += 1
        end
        print "\n Marcador: #{score[0]}-#{score[1]}\n\n"
    end
end
    
