# Exercicio 6 - Qual é o Maior
# Lê três números inteiros e imprime o maior

.data
    msg1: .asciiz "Digite o primeiro numero: "
    msg2: .asciiz "Digite o segundo numero: "
    msg3: .asciiz "Digite o terceiro numero: "
    msg_out: .asciiz "O maior numero eh: "

.text
.globl main
main:
    # --- pede o primeiro número ---
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       # $t0 = num1

    # --- pede o segundo número ---
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       # $t1 = num2

    # --- pede o terceiro número ---
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0       # $t2 = num3

    # --- lógica para encontrar o maior ---
    move $t3, $t0       # assume num1 como maior

    bgt $t1, $t3, maior_num2
    bgt $t2, $t3, maior_num3
    j imprime_maior

maior_num2:
    move $t3, $t1
    bgt $t2, $t3, maior_num3
    j imprime_maior

maior_num3:
    move $t3, $t2

imprime_maior:
    # imprime mensagem
    li $v0, 4
    la $a0, msg_out
    syscall

    # imprime o maior número
    li $v0, 1
    move $a0, $t3
    syscall

    # quebra de linha
    li $v0, 11
    li $a0, 10
    syscall

    # encerra
    li $v0, 10
    syscall
