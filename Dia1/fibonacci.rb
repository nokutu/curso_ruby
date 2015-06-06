def devolver_numeros (n)
    a = 1
    b = 0
    c = 0
    n.times do
        print a.to_s + " "
        c = a
        a = a + b
        b = c
    end
end

def numeros_menores (n)
    a = 1
    b = 0
    c = 0
    count = 0
    while a < n do
        c = a
        a = a + b
        b = c
        count += 1
    end
    count
end

puts "Escribe <a> para calcular los n primeros numeros"
puts "<b para contar la cantidad de numeros de la serie menores que n>"
operation = gets.strip

if operation == "a"
    print "\nCuantos numeros quieres calcular?"
    n = gets.to_i
    devolver_numeros(n)
elsif operation == "b"
    print "\nLos numero menores de que?"
    n = gets.to_i
    puts numeros_menores(n)
else
    print "Operación errónea"
end
