def solution(arr, divisor) :
    return sorted(list(filter(lambda x : x % divisor == 0, arr))) or [-1]