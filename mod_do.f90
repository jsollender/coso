module mod_metodos
use mod_prec
use mod_funciones
implicit none

contains

!###################################################################################
!###############        METODO DE BISECCION    #####################################
!###################################################################################



subroutine bisec (func, p, a0, b0, tolx, tolf, nit, nmax)
    real(wp), intent(in)            ::		tolx, tolf, a0, b0
	real(wp)                        ::		func
	integer(il), intent(in)			::		nmax
	
    !Variables auxiliares
    integer(il)						::	    nit, fu
	real(wp)						::		p, fa, fb, fp, aux, errorx, errorf, errorrel
	character(50)					::		file_datos_biseccion
    real(wp)        :: a, b
	

    !Bloque de Procesamiento
    file_datos_biseccion = "biseccion.dat"
	fa = func(a0)
	fb = func(b0)
	a = a0
	b = b0

!--- me fijo que ninguno sea raiz y que el intervalo sirva --------
!--- 
    
		
!--- listos a < b. Abro archivo-------------------------------
		
		write(*,*) "caca bisec"
		
		open(newunit=fu, file=file_datos_biseccion)
			
			print *, "abrio el open"
			
  			do nit = 1, 5, 1
  			 
  				write (fu,*) nit
  				write (*,*) nit
  				write (*,*) "hola"
  			
  			end do
		    
		close(fu)
	    
	
end subroutine bisec








end module mod_metodos
