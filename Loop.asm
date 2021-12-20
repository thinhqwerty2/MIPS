.include "macro.asm"

.data
	A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20


.text
main:
la $t2,A
li $t1,0
li $t6,20
Loop:			
	beq $t1,$t6,Exit		
	lw $s1,0($t2)
	addi $t2,$t2,4	
	add $s7,$s7,$s1	
	addi $t1,$t1,1
	j Loop
Exit:
write_intR($s7)

done	
