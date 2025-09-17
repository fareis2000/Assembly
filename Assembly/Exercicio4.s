# Exercicio 4 - Calculo de Fatorial
# Lê um número inteiro positivo, calcula o fatorial com laço
# e imprime o resultado.

.data
    msg_in:  .asciiz "Digite um numero inteiro positivo: "
    msg_out: .asciiz "Fatorial = "

.text
.globl main
main:
    # --- pede o número ---
    li $v0, 4
    la $a0, msg_in
    syscall

    li $v0, 5       # read_int
    syscall
    move $t0, $v0   # $t0 = número N

    # inicializa variáveis
    li $t1, 1       # contador i = 1
    li $t2, 1       # resultado = 1

loop:
    ble $t0, $zero, fim_loop   # se N <= 0, sai (tratando zero)
    bgt $t1, $t0, fim_loop     # se i > N, fim do loop

    mul $t2, $t2, $t1          # resultado *= i
    addi $t1, $t1, 1           # i++

    j loop

fim_loop:
    # imprime mensagem
    li $v0, 4
    la $a0, msg_out
    syscall

    # imprime resultado
    move $a0, $t2
    li $v0, 1
    syscall

    # quebra de linha
    li $v0, 11
    li $a0, 10
    syscall

    # encerra
    li $v0, 10
    syscall
