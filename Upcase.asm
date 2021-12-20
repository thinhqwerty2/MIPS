.include "macro.asm"
.text
main:
	endl
	write "Nhap 1 ki tu viet thuong "
	readCharR $s1
	endl
	add $s1,$s1,-32
	writeCharR $s1
done