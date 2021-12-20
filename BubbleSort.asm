.include "macro.asm"
.data
	A: .word 1,4,63,29,82,492,60,34,62,1	
.text
main:	
	endl
	li $t0,0
Lfor1: 
	bge $t0,9,Exit	
	jal Lfor2
Lfor1a:
	add $t0,$t0,1
	j Lfor1
	
Lfor2:
	li $t1,0
Loop:
	bge $t1,9,Lfor1a
	add $t2,$t1,1
	getArrW($s1,A,$t1)
	getArrW($s2,A,$t2)
	endl
	writeIntR $s1
	endl
	writeIntR $s2
	endl
	bge $s2,$s1,Swap
ASwap:
	writeIntR $s1
	endl
	writeIntR $s2
	endl
	add $t1,$t1,1
	j Loop
	
	

Swap:
	swapR($s1,$s2)
	setArrW($s1,A,$t1)
	setArrW($s2,A,$t2)
	j ASwap
Exit:
done
