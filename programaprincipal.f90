program parcial1
    
!-------------------------------------------------------------------------!
! 						PARCIAL 1 - EJERCICIO 2							  !
!-------------------------------------------------------------------------!
!						  programa principal							  !
!-------------------------------------------------------------------------!
!		       Javier MERCADO ALCOBA y Jazmín SOLLENDER					  !
!-------------------------------------------------------------------------!

    use mod_prec
    use mod_funciones
    use mod_metodos
    implicit none
    
!-------------------------------------------------------------------------!
! 					Declaración de variables							  !
!-------------------------------------------------------------------------!

	real (wp)		:: t		!variable tiempo
    real (wp)       :: a, b   	!extremos del intervalo
    real (wp)       :: p0     	!aprox. inicial de la raiz metodo Newton
    real (wp)       :: r0, r1 !aproximaciones iniciales metodo Secante
    real (wp)       :: tolx   	!tolerancia del error relativo en x
    real (wp)       :: toly   	!tolerancia del error absoluto en y
    integer (il)    :: maxite 	!maximo de iteracion permitidas
	integer (il)	:: i, fu  	!variable i iteracion, fu archivo
	character (80)	:: file_datos, file_bisec, file_newton, file_secante !variable del nombre archivo del grafico
	
!-------------------------------------------------------------------------!
! 							  Valores									  !
!-------------------------------------------------------------------------!

    tolx = 1.e-8_wp
    toly = 1.e-8_wp
    file_bisec = "biseccion.dat"
    file_newton = "newton.dat"
    file_secante = "secante.dat"
    !Parte II.b
    file_datos = "p2-funciones.dat"
	a = 0._wp
	b = 5._wp
    p0 = 1.2_wp
    r0 = 1
    r1 = 3

!-------------------------------------------------------------------------!
! 					Abrimos archivo para II.B							  !
!-------------------------------------------------------------------------!
	
	! Archivo donde almacenamos 600 puntos de los gráficos de las funciones
	! posición de los móviles para luego graficarlos usando Gnuplot.
	
	open(newunit=fu, file=file_datos)
		write(fu, '(4A20)') "t", "x1(t)", "x2(t)", "DeltaX(t)"

		do i=0, 600, 1
			t = a + i*(b-a)/600._wp
			write (fu,'(4(X, ES20.13))') t, x1(t), x2(t), DeltaX(t) 
		end do	
	close (fu)

!-------------------------------------------------------------------------!
! 					Llamamos a las funciones:							  !
!-------------------------------------------------------------------------!
	
	! Llamamos a las subrutinas para calcular las raíces. Asignamos las va-
	! riables de la subrutina.
	
	!Bisección:
	    
    ! bisec (func, a0, b0, tolx, tolf, nmax)
    call bisec (DeltaX, a, b, tolx, toly, maxite, file_bisec)
    
    !Newton-Raphson:
    
    !r_newton(f, df, raiz,  mit, tolx, toly, archivo)
    call r_newton(DeltaX, derivada, p0, maxite, tolx, toly, file_newton)
    !r_secante(f, raiz0, raiz1, mit, tolx, toly, archivo)
    
    !Secante:
    
    call r_secante(DeltaX, r0, r1, maxite, tolx, toly, file_secante)

! (:

end program parcial1
