.data
str: .asciiz "Nhap ho ten\n"
str1: .asciiz "Nhap tuoi\n"
breakline: .asciiz "\n"
str2: .asciiz "Info\n"
name: .space 30
age: .word 0
.text
main:
#in thong bao 
la $a0,str
li $v0,4
syscall
#Nhap ho ten
li $v0,8
la $a0, name
li $a1,30
syscall
##t0 luu dia chi cua bien name
add $t0,$a0,$0

#in thong bao 
la $a0,str1
li $v0,4
syscall
#Nhap tuoi
li $v0,5
la $a0, age
sw $v0,($a0)
syscall
##t0 luu dia chi cua bien name
add $t1,$a0,$0


#in thong bao 
li $v0,4
la $a0,breakline
syscall
la $a0,str2
syscall

move $a0,$t0
syscall

move $a0,$t1
syscall

li $v0,10
syscall