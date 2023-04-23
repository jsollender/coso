set term x11 persist

# parcial 1 - ejercicio 2

# MERCADO, Javier
# SOLLENDER, Jazmín

# parte II.D
# Gráfico de DeltaX(t) respecto del numero de iteraciones.

##################################################
#### 			h o l i s	 ( :			######
##################################################

	set title  "{\DeltaX(t)} respecto de N° de iteraciones."
	set xlabel "Iteracion"
	set ylabel "Delta X"
    set grid 
    #set sample 500
    
##################################################
######		G R A F.   D A T O S			######
##################################################
	
	# gráfico funcion DeltaX(t) :
	
	   plot "biseccion.dat" u 1:3 title "Función {\DeltaX(t)}" w p pointtype 7
	
	
##################################################
######			E X P O R T A R				######
##################################################
#############		P 	N 	G		 #############
	
    set terminal png size 1200,900 
    set output 'p2-deltaX-ite.png'
    replot
    
exit


