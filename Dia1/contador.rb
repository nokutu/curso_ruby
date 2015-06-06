class ContadorElectrico
  attr_accessor :lecture, :historico_lectures, :maximeter

  def initialize(params = {})
    @historico_lectures = [0]
    @lecture = 0
    @maximeter = 0
    @lecture ||= params[:lecture]
    @historico_lectures ||= params[:historico_lectures]
    @maximeter ||= params[:maximeter]
  end

  def read_kwh(value)
    fail ArgumentError, 'wrong type: integer required' \
      unless value.is_a?(Fixnum)
    @lecture += value
    @historico_lectures.push(@lecture)
  end

  def read_maximeter(value)
    @maximeter += value
  end

  def get_current_read
    @lecture
  end

  def get_current_maximeter
    @maximeter
  end

  def get_last_reads(n)
    fail ArgumentError, 'wrong type: integer required' unless n.is_a?(Fixnum)
    fail ArgumentError, 'wrong value: arguments can\'t be negative' \
      unless n >= 0

    n = @historico_lectures.size if @historico_lectures.size < n
    @historico_lectures.slice(-n..-1)
  end
end
