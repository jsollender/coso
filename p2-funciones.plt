set term x11 persist

# parcial 1 - ejercicio 2

# MERCADO, Javier
# SOLLENDER, Jazmín

# parte II.A
# Gráfico de las funciones posición de los móviles 1 y 2

##################################################
#### 			h o l i s	 ( :			######
##################################################

	set title  "Funciones posición {x_1(t)} y {x_2(t)}"
	set xlabel "Tiempo"
	set ylabel "Posición"
    set grid 
    #set sample 500
    
##################################################
######		G R A F.   D A T O S			######
##################################################
	
	# gráfico funcion x1(t) :
	
		  plot "p2-funciones.dat" u 1:2 title "Función {x_1(t)}" with points pointtype 0
	
	# gráfico función x2(t) :
	
		replot "p2-funciones.dat" u 1:3 title "Función {x_2(t)}" with points pointtype 0


##################################################
######			E X P O R T A R				######
##################################################
#############		P 	N 	G		 #############
	
    set terminal png size 1200,900 
    set output 'p2-funciones.png'
    replot
    
exit


