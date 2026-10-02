# а) печатает 1, если введённое число равно моему номеру в списке (12), иначе 0

    .text
main:
    li   a7, 5          # читаем x
    ecall

    li   t0, 12
    beq  a0, t0, yes
    li   a0, 0
    j    print
yes:
    li   a0, 1
print:
    li   a7, 1
    ecall

    li   a7, 10
    ecall
