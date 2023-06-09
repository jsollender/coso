module mod_funciones

!-------------------------------------------------------------------------!
! 						PARCIAL 1 - EJERCICIO 2							  !
!-------------------------------------------------------------------------!
!						   módulo funciones								  !
!-------------------------------------------------------------------------!
!		       Javier MERCADO ALCOBA y Jazmín SOLLENDER					  !
!-------------------------------------------------------------------------!


	use mod_prec

	contains

		function x1(t)
			real (wp), intent (in)	:: t
			real (wp)				:: x1
			
			x1 = t-10._wp	
			
		end function x1
		
		function x2(t)
			real (wp), intent (in)	:: t
			real (wp)				:: x2
			
			x2 = 100._wp*exp(-0.1_wp*t)-2._wp*t-96._wp
			
		end function x2
		
		function DeltaX(t)
			real (wp), intent (in)	:: t
			real (wp)				:: DeltaX
			
			DeltaX = 100._wp*exp(-0.1_wp*t)-3._wp*t-86._wp
		
		end function DeltaX

		function derivada(t)
			real (wp), intent (in)	:: t
			real (wp)				:: derivada
			
			derivada = -10._wp*exp(-0.1_wp*t)-3._wp
		
		end function derivada

end module mod_funciones
