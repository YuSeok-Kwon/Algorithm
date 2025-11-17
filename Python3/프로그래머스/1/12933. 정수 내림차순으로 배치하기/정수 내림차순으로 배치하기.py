def solution(n) :
    answer = [i for i in sorted(str(n), reverse=True)]
    return int("".join(answer))