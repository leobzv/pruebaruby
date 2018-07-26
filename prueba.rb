def read_file
	file = File.open('alumnos.cvs','r')
	alumnos = file.readlines.map(&:chomp).map { |e| e.split(", ") }
	file.close
	return alumnos
end

file = File.open('alumnos.cvs','r')
data = file.readlines
file.close


def smprom(data)
	generado = File.open('promalumnos.txt','w')
	data.each do |line|
		a = line.split(', ')
	    generado.puts "#{a[0]} Su promedio es "
		generado.puts (a.inject(0){ |acc, product| acc + product.to_i }.to_f / (a.length - 1) )

	end
	generado.close
	puts 'Se ha generado tu archivo de promedio de alumnos'
end


def sminasistencia
	total = 0
	alumnos = read_file
	alumnos.each do |line|
		nombre = line.shift	
		line.each do |ele|
			if ele.to_i.zero?

				total += 1
			end
			puts "El total de inasistencia es: #{total}" 
		end

	end
end

def smaprobado(data, aprobado = 5)
	data.each do |line|
		a = line.split(', ')
		b = a.inject(0){ |acc, product| acc + product.to_i }.to_f / (a.length - 1) 
		if b > aprobado
		puts "#{a[0]} Usted aprobo el curso #{b}"

		end

	end

	
end



puts 'Presione enter para ingresar'
option = gets.chomp.to_i

while option !=4
	puts "Bienvenido al generador de promedios V1.0"
	puts "1.Generar promedio de alumnos"
	puts "2.Ver total de inasistencias"
	puts "3.Alumnos aprobados"
	puts "4.Gracias por ocuparme"

	option = gets.chomp.to_i
	
	puts case option

	when 1
		smprom(data)
	when 2
		puts 'Cantidad de inasistencias'
		
		sminasistencia      

	when 3
		puts 'Ingrese nota'
		aprobado = gets.chomp.to_f 
		smaprobado(data)
		(aprobado > 0) ? smaprobado(data,aprobado): smaprobado(data)
	when 4
		puts 'salida'



	end
end