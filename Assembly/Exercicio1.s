.data
    msg: .asciiz "Hello, MIPS!"   # string
    num: .word 10                 # inteiro

.text
.globl main
main:
    # imprime string
    li $v0, 4         # serviço: print_string
    la $a0, msg       # carrega endereço da string
    syscall

    # quebra de linha
    li $v0, 11        # serviço: print_char
    li $a0, 10        # código ASCII '\n'
    syscall

    # imprime número inteiro
    la $t1, num       # pega o endereço da variável num
    lw $t0, 0($t1)    # carrega o valor armazenado (10)
    add $a0, $t0, $zero
    li $v0, 1         # serviço: print_int
    syscall

    # finaliza
    li $v0, 10
    syscall
