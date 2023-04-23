module mod_metodos
use mod_prec
use mod_funciones
implicit none

contains

!------------------------------------------------------------------------------------
!###################################################################################
!###############        METODO DE BISECCION    #####################################
!###################################################################################
!----------------------------------------------------------------------------------


subroutine bisec (func, a0, b0, tolx, tolf, nmax, file_datos_biseccion)
    real(wp), intent(in)            ::		tolx, tolf, a0, b0
	real(wp)                        ::		func
	integer(il), intent(in)			::		nmax
	
    !Variables auxiliares
    integer(il)						::	    nit, fu
	real(wp)						::		p, fa, fb, fp, aux, errorx, errorf, errorrel
	character(50)					::		file_datos_biseccion
    real(wp)        :: a, b
	

    !Bloque de Procesamiento
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
		
		open(newunit=fu, file=file_datos_biseccion)

            write (fu,'(5X, A2,4(X, A15))') "it","raiz","f(raiz)","error relativo","errorf"
						
            
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
			    
			    write (fu,'(I7, 4(2X, ES15.8))') nit, p, fp, errorrel, errorf 
                
                if ((errorf < tolf).and.(errorrel<tolx)) then
                    
                    write (*,*) "################# METODO DE BISECCION  #################   "  
                    write (*,'(5X, A2,3(X, A15))') "it","raiz","error relativo","errorf"
                    write (*,'(I7, 3(2X, ES15.8))') nit, p, errorrel, errorf  
                    				    
				    exit
				else if (nit==nmax) then
                    write(*,*) "No converge en maxite = ", nit, " iteraciones"
			    end if
			
		    end do
		    
		close(fu)
	    
	end if	
	
end subroutine bisec



!----------------------------------------------
!#############################################
!##########  METODO DE NEWTON-RAPHSON ########
!#############################################
!----------------------------------------------

subroutine r_newton(f, df, raiz,  mit, tolx, toly, archivo)
    !Descripcion del metodo de Newton-Raphson
    !El Metodo de Newton Raphson calcula la raiz de una funcion f
    !dos veces continuamente diferenciable usando su derivada df
    !comenzando con una aproximacion inicial a la raiz x0 iterando mit-veces 
    !o hasta que se alcance cierto error en x o error en y luego guarda los 
    !resultados en un archivo.dat

    !----------------------------------------
    !Declaracion Dummy Variables
    real(wp)    :: f   !funcion f(x)
    real(wp)    :: df  !Derivada de la funcion f : f'(x)
    integer, intent(in)     :: mit !numero maximo de iteraciones/iteraciones realizadas
    real(wp), intent(in)       :: raiz !aproximacion inicial de la raiz
    real(wp), intent(in)       :: tolx !error o tolerancia maxima en x
    real(wp), intent(in)       :: toly !error o tolerancia maxima en y
    character(80)              :: archivo !Archivo de texto .dat donde se guardan los datos
    !----------------------------------------
    !Declaracion de variable auxiliares
    real(wp)                :: x0, x1, err_x,err_y ,fx0 , dfx0
    integer                 :: i, fu
   

    !--------------------------------------
    !Bloque de Procesamiento
    x0 = raiz
    fx0 = f(x0)
    
    !Condiciones para que la derivada sea distinta de 0
   
    !COMPLETAR
    

    !Asumimos la derivada /= 0

    open(newunit=fu, file=archivo)
        write(fu,'(A100)') "it           aprox raiz   f(raiz)           error relativo x            error f"        
        
        do i = 1, mit, 1
            
            x1 = x0 - fx0/df(x0)
            fx0 = f(x1)
            err_x = abs(x1 - x0)/ abs(x1)
            err_y = abs(fx0)
    
            write(fu,'(I7, 5(X,E19.12))') i, x1, fx0,  err_x, err_y
            if ((err_x < tolx) .or. (err_y < toly)) then
                
                exit
            end if
            x0 = x1

        end do
    close(fu)
end subroutine r_newton

!------------------------------------------------------------------
!#################################################################
!#############      METODO DE LA SECANTE    ######################
!################################################################



subroutine r_secante(f, raiz0, raiz1, mit, tolx, toly, archivo)
    !Descripcion de la subrutina del metodo de la secante
    
    !Declaracion de Dummy Variables
    real(wp)            :: f !funcion f(x)
    real(wp), intent(in)      :: raiz0 !una de las primeras aprox. de la raiz
    real(wp), intent(in)      :: raiz1 !una de las primeras aprox. de la raiz
    real(wp), intent(in)      ::  tolx !error relativo o absoluto de x
    real(wp), intent(in)      ::  toly !error absoluto de y
    integer, intent(in)      :: mit !maximo de iteraciones/iteraciones alcanzadas
    character(80)           :: archivo

    !Declaracion de Variables Auxiliares
    real(wp)                :: x0, x1, fx0, fx1, xr, fxr,errx,erry
    integer                 :: i, fu

    !Bloque de procesamiento
    x0 = raiz0 
    x1 = raiz1
    fx0 = f(x0)
    fx1 = f(x1)
    
    !Alguna condicion de parada si las raices cumplen la tolerancia
    !COMPLETAR

    !Asumimos que funciona en el mejor de los casos |f(a)| < |f(b)|
    !hacer un swap

    
    open(newunit=fu, file=archivo)
        write(fu, *) "nit   aproximacion_raices   f(raiz)   error_x     error _y"
        
        do i = 1, mit, 1
            xr = x1 - fx1*((x1 - x0)/(fx1 - fx0))   
            fxr = f(xr)
            errx = abs(xr - x1)
            erry = abs(fxr)
            !write(*,'(I7, 5(X,E19.12))' ) i, xr, fxr, errx, erry 
            
            write(fu,'(I7, 5(X,E19.12))' ) i, xr, fxr, errx, erry 
            if ((errx < tolx) .or. (erry < toly)) then
                exit
            end if
            x0 = x1
            x1 = xr
            fx0 = fx1
            fx1 = f(x1)
        end do

    close(fu)

end subroutine
!--------------------------------------------------------------------
!###################################################################
!################## METODO DE REGULA - FALSI #######################
!###################################################################

subroutine r_regula_falsi(f, a, b, mit, tolx, toly, archivo)
    !Descripcion del metodo de Regula Falsi
    !COMPLETAR
    !-------------------------------------------
    !Declaracion de Dummy variables
    real(wp)                    :: f !funcion f(x) al cual le buscamos las raices
    real(wp), intent(in)        :: a !extremo izquierlo del intervalo  / primeras aprox raiz
    real(wp), intent(in)        :: b !extremo derecho del intervalo / primeras aprox raiz
    integer, intent(in)         :: mit !maximo numero de iteraciones
    real(wp), intent(in)        :: tolx ! error relativo/absoluto esperado en x
    real(wp), intent(in)        :: toly ! error absoluto esperado en y
    character(80)               :: archivo
    
    !Declaracion de variables auxiliares
    real(wp)           :: x0, x1, xr, fx0, fx1, fxr ,errx, erry
    integer                     :: i, fu


    !Bloque de Procesamiento
    x0 = a
    x1 = b
    fx0 = f(x0)
    fx1 = f(x1)
    
    if (f(a)*f(b) > 0) then
        write(*,*) "f(a) y f(b) tienen el mismo signo, Pruebe otros valores!"
        stop
    end if
    !Asumiendo a < b y f(a)*f(b) < 0
    
    open(newunit=fu, file=archivo)
        write(fu, '(A100)') "nit        aprox. raiz         f(raiz)     error_x         error_y"
        do i = 1 , mit, 1
            xr = x0 - fx0*((x1 - x0)/(fx1 - fx0))
            fxr = f(xr)
            errx = abs(xr - x0)
            erry = abs(fxr)
            write(fu, '(I7, 5(X,ES19.12))') i , xr , fxr, errx, erry
            if ((errx < tolx).or.(erry < toly)) then
                exit
            end if
            
            if (fxr*fx0 < 0) then
                x1 = xr
                fx1 = fxr
            else    
                x0 = xr    
                fx0 = fxr
            end if 
        end do
    close(fu)
end subroutine r_regula_falsi




end module mod_metodos
