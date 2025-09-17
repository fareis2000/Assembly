# Exercicio 3 - Verificação de Número
# Lê um número inteiro e diz se é positivo, negativo ou zero

.data
    msg_in:    .asciiz "Digite um numero inteiro: "
    msg_pos:   .asciiz "O numero eh positivo.\n"
    msg_neg:   .asciiz "O numero eh negativo.\n"
    msg_zero:  .asciiz "O numero eh zero.\n"

.text
.globl main
main:
    # --- pede o número ---
    li $v0, 4
    la $a0, msg_in
    syscall

    li $v0, 5       # read_int
    syscall
    move $t0, $v0   # guarda número em $t0

    # --- verifica se é zero ---
    beq $t0, $zero, eh_zero   # se $t0 == 0 -> vai pra eh_zero

    # --- verifica se é positivo ---
    bgt $t0, $zero, eh_pos    # se $t0 > 0 -> vai pra eh_pos

    # se não é zero e não é positivo, então é negativo
    j eh_neg

eh_zero:
    li $v0, 4
    la $a0, msg_zero
    syscall
    j fim

eh_pos:
    li $v0, 4
    la $a0, msg_pos
    syscall
    j fim

eh_neg:
    li $v0, 4
    la $a0, msg_neg
    syscall
    j fim

fim:
    li $v0, 10
    syscall
