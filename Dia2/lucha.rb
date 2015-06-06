TABLA = {
  ['Ninja', :fuerza_manos]      => 5,
  ['Ninja', :prob_manos]        => 0.5,
  ['Ninja', :fuerza_piernas]    => 3,
  ['Ninja', :prob_piernas]      => 0.5,
  ['Ninja', :prob_esquivar]     => 0.8,
  ['Karateka', :fuerza_manos]   => 6,
  ['Karateka', :prob_manos]     => 0.3,
  ['Karateka', :fuerza_piernas] => 4,
  ['Karateka', :prob_piernas]   => 0.7,
  ['Karateka', :prob_esquivar]  => 0,
  ['Boxeador', :fuerza_manos]   => 10,
  ['Boxeador', :prob_manos]     => 1,
  ['Boxeador', :prob_esquivar]  => 0.4
}
# Clase abstracta para luchador estandar
class Luchador
  attr_accessor :vida, :name

  def initialize(name = self.class.to_s)
    @vida = 100
    @name = name
  end

  def golpear_manos(objetivo)
    fuerza = TABLA[[self.class.to_s, :fuerza_manos]]
    print "#{name} pega con manos."
    if Random.rand > TABLA[[objetivo.class.to_s, :prob_esquivar]]
      objetivo.vida -= fuerza
      print ' Acierta.'
    else
      print ' Falla.'
    end
  end
end

# Modulo para los luchadores que pueden dar patadas
module Patadas
  def golpear_patada(objetivo)
    fuerza = TABLA[[self.class.to_s, :fuerza_piernas]]
    print "#{name} pega patada."
    if Random.rand > TABLA[[objetivo.class.to_s, :prob_esquivar]]
      objetivo.vida -= fuerza
      print ' Acierta.'
    else
      print ' Falla.'
    end
  end
end

# Luchador: Karateka
class Karateka < Luchador
  include Patadas
end

# Luchador: Ninja
class Ninja < Luchador
  include Patadas
end

# Luchador: Boxeador
class Boxeador < Luchador
end

# Clase principal del programa
class Combate
  attr_accessor :luchadores, :victorias, :resultado, :fights

  def initialize(luchadores)
    @victorias = [0] * luchadores.size
    @luchadores = luchadores
    @resultado = []
    @fights = {}
  end

  def iniciar
    luchadores.each_with_index do |luchador1, i|
      luchadores.each_with_index do |luchador2, j|
        next unless i != j && fights[[i, j]].nil?
        pelea(luchador1, luchador2, i, j)
      end
    end
    clasificacion
  end

  def pelea(luchador1, luchador2, i, j)
    if luchar(luchador1, luchador2) == -1
      victorias[i] += 1
    else
      victorias[j] += 1
    end
    fights[[i, j]] = 1
  end

  def luchar(luchador1, luchador2)
    puts "Empieza #{luchador1.name} contra #{luchador2.name}"
    turno = 1
    turno *= -1 if Random.rand(2) == 0
    while luchador1.vida > 0 && luchador2.vida > 0
      turno(luchador1, luchador2, turno)
      imprimir_estado(luchador1, luchador2)
      turno *= -1
    end
    fin_lucha(luchador1, luchador2)
  end

  def turno(luchador1, luchador2, turno)
    luchador2, luchador1 = luchador1, luchador2 if turno == 1
    if Random.rand > TABLA[[luchador1.class.to_s, :prob_manos]]
      luchador1.golpear_patada(luchador2)
    else
      luchador1.golpear_manos(luchador2)
    end
    [luchador1, luchador2].each do |luc|
      luc.vida = 0 unless luc.vida > 0
    end
  end

  def imprimir_estado(luchador1, luchador2)
    print " Vida #{luchador1.name} #{luchador1.vida}, " \
      "vida #{luchador2.name} #{luchador2.vida}\n"
  end

  def clasificacion
    unir
    puts 'CLASIFICACION'
    n = 1
    resultado.each do |line|
      puts "#{n}. #{line[1]} - #{line[0]}"
      n += 1
    end
  end

  def fin_lucha(luchador1, luchador2)
    if luchador1.vida <= 0
      puts "Gana #{luchador2.name}\n\n"
      ret = 1
    else
      puts "Gana #{luchador1.name}\n\n"
      ret = -1
    end
    luchador1.vida = 100
    luchador2.vida = 100
    ret
  end

  def unir
    victorias.size.times do |n|
      resultado.push([victorias[n], luchadores[n].name])
      resultado.sort!.reverse!
    end
  end
end

Combate.new([Boxeador.new, Karateka.new, Ninja.new, Boxeador.new, Karateka.new,
             Ninja.new]).iniciar
