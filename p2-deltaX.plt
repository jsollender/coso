set term x11 persist

# parcial 1 - ejercicio 2

# MERCADO, Javier
# SOLLENDER, Jazmín

# parte II.C
# Gráfico de la diferencia de posiciones de los moviles DeltaX(t)

##################################################
#### 			h o l i s	 ( :			######
##################################################

	set title  "Funcion Posicion {\DeltaX(t)}"
	set xlabel "Tiempo"
	set ylabel "Delta X"
    set grid 
    #set sample 500
    
##################################################
######		G R A F.   D A T O S			######
##################################################
	
	# gráfico funcion DeltaX(t) :
	
	   plot "p2-funciones.dat" u 1:4 title "Función {\DeltaX(t)}" w p pointtype 0
	
	
##################################################
######			E X P O R T A R				######
##################################################
#############		P 	N 	G		 #############
	
    set terminal png size 1200,900 
    set output 'p2-deltaX.png'
    replot
    
exit


