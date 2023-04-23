set term x11 persist

# parcial 1 - ejercicio 2

# MERCADO, Javier
# SOLLENDER, Jazmín

# parte II.A
# Gráfico de comparación entre métodos.

##################################################
####            h o l i s    ( :            ######
##################################################

    set title  "Iteracion vs Error Relativo x "
    set xlabel "Tiempo"
    set ylabel "Posición"
    set grid
    set logscale xy
    #set sample 500

##################################################
######      G R A F.   D A T O S            ######
##################################################
    
    # grafico error relativo biseccion    
    
          plot "biseccion.dat" u 1:4 title "Biseccion" w lp pointtype 7  
    
    
    # gráfico error relativo newton :

         replot "newton.dat" u 1:4 title "Newton" w lp pointtype 5


    # gráfico error relativo secante:

        replot "secante.dat" u 1:4 title "Secante" w lp pointtype 9


##################################################
######          E X P O R T A R             ######
##################################################
############       P   N   G         #############

    set terminal png size 1200,900
    set output 'p2-error-ite.png'
    replot

exit
