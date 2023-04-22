module mod_metodos
use mod_prec
use mod_funciones
implicit none

contains

!###################################################################################
!###############        METODO DE BISECCION    #####################################
!###################################################################################



subroutine bisec (func, a0, b0, tolx, tolf, nmax)
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
    if (fa*fb == 0) then !alguno de los dos es raiz. hay q ver cual
		if((fa == 0).and.(fb/=0)) then
			print *, a, "es raiz"
		else if ((fb==0).and.(fa/=0)) then
			print *, b, "es raiz"
		else
			print *, a, "y", b, "son ambos raices"
		end if
			
	else if (fa*fb>0) then 
		print *, "Este intervalo no sirve. Elija otro, por favor."
		
			
	else !fa*fb<0 osea fa y fb tienen signo opuesto
	
!--- acá chequeo que a<b. si no, reasigno -----------------

		if (b<a) then
			aux = a
			a = b
			b = aux
		end if
		
!--- listos a < b. Abro archivo-------------------------------
		write(*,*) "caca bisec"
		open(newunit=fu, file=file_datos_biseccion)
			print *, "caca 3"
            !write (fu,'(X5A2,4A15)') "it","raiz","f(raiz)","error relativo","errorf"
			write (fu,*) "it","raiz","f(raiz)","error relativo","errorf"

			print *, "caca 4"
			
            
		    do nit = 1, nmax, 1
			
			    errorx = (b-a)*0.5_wp 
			    p = a + errorx
			    fp = func(p)
			    errorf = abs(fp)
			    errorrel = errorx/p
			   
			    if (fa*fp<0) then
				    b = p
			    else if (fb*fp<0) then		
				    a = p
				end if
			    
			    !write (fu,'(I7, 4ES15.8)') nit, p, fp, errorrel, errorf 
                write (fu,*) nit, p, fp, errorrel, errorf 
			    print *, "holas"
			    if ((errorf < tolf).and.(errorrel<tolx)) then
                    write (*,*) " ################# METODO DE BISECCION  #################   "  
                    !write (*,'(X5A2,3A15)') "it","raiz","error relativo","errorf"
                   write (*,*) "it","raiz","error relativo","errorf"

                     !write (*,'(I7, 3ES15.8)') nit, p, errorrel, errorf  
                    write (*,*) nit, p, errorrel, errorf
				    exit
				else if (nit==nmax) then
                    write(*,*) "No converge en maxite = ", nit, " iteraciones"
			    end if
			
		    end do
		    
		close(fu)
	    
	end if	
	
end subroutine bisec








end module mod_metodos
