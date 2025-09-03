.data
.text

main:
	li $s0, 0
	li $s1, 100 #b=100
	li $s2, 50 
	li $s3, 25
	li $s4, 10
	li $s5, 5

	add $t0, $s1, $s2
	add $t1, $s3, $s4
	add $t1, $t1, $s5
	sub $s0, $t0, $t1