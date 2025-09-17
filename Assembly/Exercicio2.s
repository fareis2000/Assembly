# Exercicio 2 - Soma de Dois Números
# O programa lê dois inteiros do usuário, soma e imprime o resultado.

.data
    msg1: .asciiz "Digite o primeiro numero: "
    msg2: .asciiz "Digite o segundo numero: "
    msg3: .asciiz "Resultado da soma: "

.text
.globl main
main:
    # --- pede o primeiro número ---
    li $v0, 4           # print_string
    la $a0, msg1
    syscall

    li $v0, 5           # read_int
    syscall
    move $t0, $v0       # guarda primeiro número em $t0

    # --- pede o segundo número ---
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       # guarda segundo número em $t1

    # --- soma ---
    add $t2, $t0, $t1   # $t2 = $t0 + $t1

    # --- imprime resultado ---
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1           # print_int
    move $a0, $t2
    syscall

    # quebra de linha
    li $v0, 11
    li $a0, 10
    syscall

    # --- encerra ---
    li $v0, 10
    syscall