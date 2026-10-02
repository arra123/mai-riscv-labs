# Задача а. Вычислительные системы, практическое занятие 02.10.2026
# Пущин Тимофей Андреевич, М3О-121СВ-26, номер в списке группы: 12
#
# Программа читает целое x и печатает 1, если x равен номеру студента
# в списке группы, иначе 0.

        .eqv    STUDENT, 12         # мой номер в списке группы
        .eqv    SYS_PRINT_INT, 1
        .eqv    SYS_READ_INT, 5
        .eqv    SYS_EXIT, 10

        .text
        .globl  main
main:
        li      a7, SYS_READ_INT
        ecall                       # a0 = x

        li      t0, STUDENT
        xor     t1, a0, t0          # t1 = 0 только при x == STUDENT
        seqz    a0, t1              # a0 = (t1 == 0) ? 1 : 0

        li      a7, SYS_PRINT_INT
        ecall                       # печать 1 или 0

        li      a7, SYS_EXIT
        ecall
