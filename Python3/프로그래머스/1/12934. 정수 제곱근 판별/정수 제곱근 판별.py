def solution(n):
    sqrt_num = n ** 0.5
    if sqrt_num % 1 == 0:
        return (sqrt_num + 1) ** 2
    else:
        return -1