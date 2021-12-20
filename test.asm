.include "macro.asm"

.data
	A: .word 0:20
.text
main:
endl
.macro Lfor1
	write "Nhap so thu "
	writeIntR $t0
	write " "
	readIntR $s1
	setArrW $s1,A,$t0
		
.end_macro

.macro Lfor2
	write "A["
	writeIntR $t0
	write "] ="
	getArrW $s1,A,$t0
	writeIntR $s1
	endl
.end_macro

forR($t0,1,5,Lfor1)
forR($t0,1,5,Lfor2)

done
