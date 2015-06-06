class PuntoDeSuministro
    attr_accessor :tarifa, :potencia
    @@PRECIOS_POR_TARIFA = {2.0 => 0.1, 3.1 => 0.05}

    def initialize(params = {})
        @tarifa = params[:tarifa]
        @potencia = params[:potencia]
    end

    def facturar(n, k)
        raise ArgumentError, "wrong type: arguments must be integers" unless n.is_a?(Fixnum) && k.is_a?(Fixnum)
        raise ArgumentError, "wrong value: arguments must be possitive" unless n >= 0 && k >= 0
        if @@PRECIOS_POR_TARIFA.include?(tarifa)
            @@PRECIOS_POR_TARIFA[@tarifa]*k + n* @potencia
        end
    end
end
#puts PuntoDeSuministro.new({:tarifa => 2.0, :potencia => 10}).facturar(10,10)
