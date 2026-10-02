# в) читает числа в массив из 28 элементов (16 + 12),
#    останавливается, когда массив заполнен или ввели 0

    .data
arr:    .space 112      # 28 * 4

    .text
main:
    la   t0, arr
    li   t1, 0          # сколько уже прочитали
    li   t2, 28

read:
    beq  t1, t2, end
    li   a7, 5
    ecall
    beqz a0, end
    sw   a0, 0(t0)
    addi t0, t0, 4
    addi t1, t1, 1
    j    read

end:
    li   a7, 10
    ecall
