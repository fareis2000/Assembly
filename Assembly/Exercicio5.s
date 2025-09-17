# Exercicio 5 - Aprovado ou Reprovado
# Lê uma nota (0 a 100) e imprime "Aprovado" se >= 70, senão "Reprovado".

.data
    msg_in:  .asciiz "Digite a nota do aluno (0-100): "
    msg_ok:  .asciiz "Aprovado\n"
    msg_fail:.asciiz "Reprovado\n"

.text
.globl main
main:
    # --- pede a nota ---
    li $v0, 4
    la $a0, msg_in
    syscall

    li $v0, 5       # read_int
    syscall
    move $t0, $v0   # guarda a nota em $t0

    # --- verifica condicao ---
    li $t1, 70
    bge $t0, $t1, aprovado   # se nota >= 70, vai para aprovado

reprovado:
    li $v0, 4
    la $a0, msg_fail
    syscall
    j fim

aprovado:
    li $v0, 4
    la $a0, msg_ok
    syscall

fim:
    li $v0, 10
    syscall
