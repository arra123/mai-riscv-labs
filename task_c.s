# Задача в. Вычислительные системы, практическое занятие 02.10.2026
# Пущин Тимофей Андреевич, М3О-121СВ-26, номер в списке группы: 12
#
# Программа заполняет массив из 16 + n = 28 целых чисел значениями
# со стандартного ввода (n = 12, номер студента в группе).
# Чтение идёт в цикле и заканчивается, когда считаны все 28 значений
# или когда считан 0. Сам 0 в массив не записывается: это признак конца.
# Для проверки в конце печатается число считанных элементов и сам массив.

        .eqv    SIZE, 28            # 16 + 12
        .eqv    SYS_PRINT_INT, 1
        .eqv    SYS_READ_INT, 5
        .eqv    SYS_EXIT, 10
        .eqv    SYS_PRINT_CHAR, 11

        .data
array:  .space  112                 # SIZE * 4 байта

        .text
        .globl  main
main:
        la      s0, array           # s0 = адрес очередного элемента
        li      s1, 0               # s1 = сколько элементов считано
        li      s2, SIZE

read_loop:
        bge     s1, s2, read_done   # массив заполнен
        li      a7, SYS_READ_INT
        ecall                       # a0 = очередное значение
        beqz    a0, read_done       # 0: конец ввода
        sw      a0, 0(s0)           # array[s1] = a0
        addi    s0, s0, 4
        addi    s1, s1, 1
        j       read_loop

read_done:
        mv      a0, s1              # проверка: число считанных элементов
        li      a7, SYS_PRINT_INT
        ecall
        li      a0, '\n'
        li      a7, SYS_PRINT_CHAR
        ecall

        la      s0, array           # проверка: печать массива
        li      t0, 0
print_loop:
        bge     t0, s1, exit
        lw      a0, 0(s0)
        li      a7, SYS_PRINT_INT
        ecall
        li      a0, ' '
        li      a7, SYS_PRINT_CHAR
        ecall
        addi    s0, s0, 4
        addi    t0, t0, 1
        j       print_loop

exit:
        li      a7, SYS_EXIT
        ecall
