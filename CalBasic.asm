.data
str1: .asciiz "Nhap a\n"
str2: .asciiz "Nhap b\n"
stradd: .asciiz "a+b="
strsub: .asciiz "a-b="
strmul: .asciiz "a*b="
strdiv: .asciiz "a/b="
strR: .asciiz " r="
breakline: .asciiz "\n"
s: .word 0
.text
main:
#Thong bao
li $v0,4
la $a0,str1
syscall
#Nhap a vao t0
li $v0,5
syscall
move $t0,$v0
#Thong bao
li $v0,4
la $a0,str2
syscall
#Nhap b vao t1
li $v0,5
syscall
move $t1,$v0


#Thong bao

li $v0,4
la $a0,stradd
syscall

#a+b
li $v0,1
add $s0,$t0,$t1
move $a0,$s0
syscall
li $v0,4
la $a0,breakline
syscall

#Thong bao
li $v0,4
la $a0,strsub
syscall
#a-b
li $v0,1
sub $s0,$t0,$t1
move $a0,$s0
syscall
li $v0,4
la $a0,breakline
syscall

#Thong bao
li $v0,4
la $a0,strmul
syscall
#a*b
li $v0,1
mult $t0,$t1
mflo $a0
syscall
li $v0,4
la $a0,breakline
syscall

#Thong bao
li $v0,4
la $a0,strdiv
syscall
#a/b
li $v0,1
div $s0,$t0,$t1
mflo $a0
syscall

#Thong bao
li $v0,4
la $a0,strR
syscall

#r=
mfhi $a0
li $v0,1
syscall

li $v0,4
la $a0,breakline
syscall

li $v0,10
syscall



