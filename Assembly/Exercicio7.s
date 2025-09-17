# Exercicio 7 - Verificador de Ano Bissexto
# Lê um ano inteiro e verifica se é bissexto

.data
    msg_in:  .asciiz "Digite um ano: "
    msg_yes: .asciiz "Ano Bissexto\n"
    msg_no:  .asciiz "Nao eh um Ano Bissexto\n"

.text
.globl main
main:
    # --- pede o ano ---
    li $v0, 4
    la $a0, msg_in
    syscall

    li $v0, 5       # read_int
    syscall
    move $t0, $v0   # $t0 = ano

    # --- verifica divisibilidade por 400 ---
    li $t1, 400
    rem $t2, $t0, $t1   # $t2 = ano % 400
    beq $t2, $zero, bissexto   # se divisível por 400 -> bissexto

    # --- verifica divisibilidade por 100 ---
    li $t1, 100
    rem $t2, $t0, $t1
    beq $t2, $zero, nao_bissexto  # se divisível por 100 (mas não 400) -> não bissexto

    # --- verifica divisibilidade por 4 ---
    li $t1, 4
    rem $t2, $t0, $t1
    beq $t2, $zero, bissexto       # se divisível por 4 -> bissexto

    # --- se nenhum dos anteriores ---
    j nao_bissexto

bissexto:
    li $v0, 4
    la $a0, msg_yes
    syscall
    j fim

nao_bissexto:
    li $v0, 4
    la $a0, msg_no
    syscall

fim:
    li $v0, 10
    syscall
