################################## WRITE #################################
#In chuoi thong thuong
.macro write(%str)
.data
	myLabelMacro: .asciiz %str
.text
	li $v0, 4
	la $a0, myLabelMacro
	syscall
.end_macro
#Xuong dong
.macro endl
.text
	write("\n")
.end_macro
#In so nguyen trong thanh ghi %r
.macro writeIntR (%r)
.text
	li $v0, 1
	add $a0, $zero, %r
	syscall
.end_macro
#In so nguyen trong bien %x
.macro writeIntV (%x)
.text
	li $v0, 1	
	lw $a0,%x
	syscall
.end_macro
#In ki tu trong thanh ghi %r
.macro writeCharR (%r)
.text
	move $a0,%r
	li $v0,11
	syscall
.end_macro
#In ki tu trong bien %x
.macro writeCharV (%x)
.text
	lw $a0,%x
	li $v0,11
	syscall
.end_macro
#In chuoi trong bien %s	
.macro writeStrV(%s)
.text
	la $a0,%s
	li $v0,4
	syscall
.end_macro

################################## READ #################################
#Nhap so nguyen vao thanh ghi %r
.macro readIntR(%r)
.text
	li $v0,5
	syscall
	move %r,$v0
.end_macro
#Nhap so nguyen vao bien %x
.macro readIntV(%x)
.text
	li $v0,5
	syscall
	sw $v0,%x
.end_macro
#Nhap ki tu vao thanh ghi %r
.macro readCharR(%r)
.text
	li $v0,12
	syscall
	move %r,$v0
.end_macro
#Nhap ki tu vao bien %x
.macro readCharV(%x)
.text	
	li $v0,12
	syscall
	sw $v0,%x
.end_macro
#Nhap chuoi vao bien %s, co do dai la %len mac dinh la 255
.macro readStrV(%s,%len)
.text
	li $v0,8
	la $a0,%s
	li $a1,%len
	syscall	
.end_macro

################################## ARRAY #################################
#Khai bao mang arr co chieu dai la n


#Doc phan tu i cua bien arr tra ve thanh ghi r , neu ko co mac dinh tra ve thanh ghi v1
.macro getArrW(%r,%arr,%i)
	move $t9,$zero
	add $t9,$t9,%i
	li $t8,4
	mult $t9,$t8
	mflo $t9 #offset
	la $t8,%arr #dia chi co so arr[0]
	add $t8,$t8,$t9 #dia chi arr[i]
	lw %r,0($t8) 
.end_macro

#Gan gia tri thanh ghi r cho phan tu i cua bien arr
.macro setArrW(%r,%arr,%i)
	move $t9,$zero
	add $t9,$t9,%i
	li $t8,4
	mult $t9,$t8
	mflo $t9 #offset
	la $t8,%arr #dia chi co so arr[0]
	add $t8,$t8,$t9 #dia chi cua arr[i]
	sw %r,($t8)
.end_macro


################################## CONTROL #################################
#Exit
.macro done
.text
	li $v0,10
	syscall 
.end_macro
#For (r,form,to,body)   lap tu from den to thuc hien macro body()|| Bien dem la thanh ghi r
#De khoi lenh for sau khoi lenh body
.macro forR (%r, %from, %to, %body)
.text
	add %r, $zero, %from
	LoopMacro:
	%body
	add %r, %r, 1
	ble %r, %to, LoopMacro
.end_macro
.macro forR1 (%r, %from, %to, %body)
.text
	add %r, $zero, %from
	LoopMacro1:
	%body
	add %r, %r, 1
	ble %r, %to, LoopMacro1
.end_macro

.macro forV (%x, %from, %to, %body)
.text
	move $t9,$zero
	add $t9,$t9,%from
	sw $t9,%x
	LoopMacro:
	%body
	add $t9, $t9, 1
	sw $t9,%x
	ble $t9, %to, LoopMacro
.end_macro

#While (r,body)  lap den khi gia tri r = 0 thuc hien body
.macro whileR(%r,%body)
	LoopMacro

.end_macro
#move(x,y) gan gia tri cua bien y cho bien x
.macro moveV(%x,%y)
	lw $t9,%y
	sw $t9,%x
.end_macro
################################## EXTENSION #################################
#mod(r,x,y) tinh so du cua x/y ket qua luu vao r
.macro modR(%rs,%x,%y)
	rem  %rs,%x,%y
.end_macro
.macro modV(%rs,%x,%y)
	lw $t8,%x
	lw $t9,%y
	rem  %rs,$t8,$t9
.end_macro
#div(r,x,y) tinh thuong cua x/y ket qua luu vao thanh ghi rs
.macro divR(%rs,%x,%y)
	div %x,%y
	mflo %rs
.end_macro

.macro divV(%rs,%x,%y)
	lw $t8,%x
	lw $t9,%y
	divR %rs,$t8,$t9
.end_macro
#swap(x,y) doi gia tri cua x y
.macro swapR(%x,%y)
	move $t9,%x
	move %x,%y
	move %y,$t9
.end_macro
.macro swapV(%x,%y)
	lw $t8,%x
	moveV %x,%y
	sw  $t8,%y
.end_macro
#len(n,arr) lay do dai cua day
.macro len(%n,%arr)
	
.end_macro
#Nhap cac phan tu la so nguyen vao mang arr
.macro getArr(%arr)
.end_macro
#upcase(x,y)  





