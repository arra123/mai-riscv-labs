# Задача б. Вычислительные системы, практическое занятие 02.10.2026
# Пущин Тимофей Андреевич, М3О-121СВ-26, номер в списке группы: 12
#
# Программа читает целое x и печатает все значения из диапазона
# min(x, y)...max(x, y) с шагом h, где y = 121 (номер группы),
# h = 12 (номер студента в группе). Каждое значение с новой строки.

        .eqv    GROUP, 121          # y, номер группы
        .eqv    STEP, 12            # h, мой номер в списке группы
        .eqv    SYS_PRINT_INT, 1
        .eqv    SYS_READ_INT, 5
        .eqv    SYS_EXIT, 10
        .eqv    SYS_PRINT_CHAR, 11

        .text
        .globl  main
main:
        li      a7, SYS_READ_INT
        ecall                       # a0 = x

        mv      s0, a0              # s0 = текущее значение, начинаем с min
        li      s1, GROUP           # s1 = верхняя граница, max
        ble     s0, s1, ordered     # x <= y: границы уже по порядку
        mv      s0, s1              # иначе min = y,
        mv      s1, a0              #        max = x
ordered:
        li      s2, STEP

loop:
        bgt     s0, s1, done        # вышли за max: конец

        mv      a0, s0
        li      a7, SYS_PRINT_INT
        ecall                       # печать текущего значения
        li      a0, '\n'
        li      a7, SYS_PRINT_CHAR
        ecall

        add     t0, s0, s2          # следующее значение
        blt     t0, s0, done        # защита от переполнения у границы int
        mv      s0, t0
        j       loop

done:
        li      a7, SYS_EXIT
        ecall
