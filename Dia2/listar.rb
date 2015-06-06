files = Dir.glob('*.rb')
out = File.open('files.csv', 'w')
out.puts('"Fichero";"Tamaño";"Ruta";"Creación"')

files.each do |file|
  stats = File.open(file, 'r').stat
  size = stats.size
  route = Dir.pwd + "/#{file}"
  ctime = stats.ctime
  out.puts("#{file.inspect};#{size};#{route.inspect};#{ctime}")
end
out.close
