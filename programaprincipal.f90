program parcial1

!! CACA
!! CACA PRUEBA GIT
    use mod_prec
    use mod_funciones
    use mod_metodos
    implicit none
    
	!Declaracion de variables
	real (wp)		:: t		!variable tiempo
    real (wp)       :: a, b   	!extremos del intervalo
    real (wp)       :: p0     	!aprox. inicial de la raiz metodo Newton
    real (wp)       :: x0, x1 !aproximaciones iniciales metodo Secante
    real (wp)       :: tolx   	!tolerancia del error relativo en x
    real (wp)       :: toly   	!tolerancia del error absoluto en y
    integer (il)    :: maxite 	!maximo de iteracion permitidas
	integer (il)	:: i, fu  	!variable i iteracion, fu archivo
	character (80)	:: file_datos !variable del nombre archivo del grafico
	
	!-------------------------------------------------------------------------
    !Parte II.b
    file_datos = "p2-funciones.dat"
	a = 0._wp
	b = 5._wp
	
	open(newunit=fu, file=file_datos)
		write(fu, '(4A20)') "t", "x1(t)", "x2(t)", "DeltaX(t)"

		do i=0, 600, 1
			t = a + i*(b-a)/600._wp
			write (fu,'(4(X, ES20.13))') t, x1(t), x2(t), DeltaX(t) 
		end do	
	close (fu)

    !-------------------------------------------------------------------------
    
end program parcial1
