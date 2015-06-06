class Barco
  @@cantidad = 0

  attr_accessor :eslora, :max_velocidad, :n_pasajeros

  def initialize
    @eslora = params { :eslora }
    @max_velocidad = params { :max_velocidad }
    @n_pasajeros = params { :n_pasajeros }
    @@cantidad += 1
  end

  def tiempo(distancia)
    distancia / @max_velocidad
    rescue
      puts 'Error: la velocidad no puede ser 0'
  end

  def mantenimiento
    @eslora * @n_pasajeros * 10
  end
end

class Velero < Barco
  @@cantidad = 0

  attr_accessor :n_velas

  def initialize
    super(params)
    @n_velas = params { :n_velas }
    @@cantidad += 1
  end
end

class Motor < Barco
  @@cantidad = 0

  attr_accessor :n_motores, :potencia

  def initialize
    super(params)
    @n_motores = params { :n_motores }
    @potencia = params { :potencia }
    @@cantidad += 1
  end
end

class Remo < Barco
  @@cantidad = 0

  attr_accessor :n_remos

  def initialize
    super(params)
    @n_remos = params { :n_remos }
    @@cantidad += 1
  end

  def mantenimiento
    @eslora * @n_remos * 5
  end
end
