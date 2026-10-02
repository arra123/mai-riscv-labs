# б) печатает числа от min(x, y) до max(x, y) с шагом h
#    y = 121 (группа), h = 12 (номер в списке)

    .text
main:
    li   a7, 5          # читаем x
    ecall

    mv   t0, a0         # t0 - откуда идём
    li   t1, 121        # t1 - докуда
    ble  t0, t1, loop
    mv   t0, t1         # x больше y, меняем местами
    mv   t1, a0

loop:
    bgt  t0, t1, end
    mv   a0, t0
    li   a7, 1
    ecall
    li   a0, '\n'
    li   a7, 11
    ecall
    addi t0, t0, 12
    j    loop

end:
    li   a7, 10
    ecall
