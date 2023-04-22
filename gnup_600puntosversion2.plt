set term x11 persist

##################################################
#### 			h o l i s	 ( :			######
##################################################

	set title " T I T U L "
	set xlabel "equis"
	set ylabel "igriega"
    set grid 
    #set sample 500
    
##################################################
######		G R A F.   D A T O S			######
##################################################
	
	# gráfico funcion x1(t) :
	  plot "p2-funciones.dat" u 1:2 with linespoints linetype 1 linewidth 1
	
	# gráfico función x2(t) :
	replot "p2-funciones.dat" u 1:3 with linespoints linetype 2 linewidth 2
	
	
#using n:m para seleccionar que columnas graficar#




####Próximamente, solo en cines:


##################################################
######			E X P O R T A R				######
##################################################
#############		P 	N 	G		 #############

	
    set terminal png size 1200,900 
    set output 'output.png'
    replot
#############		P 	D 	F		 #############

	#set terminal pdf enhanced font "Helvetica, 11"
	#set output "nombre_grafico.pdf"
exit


