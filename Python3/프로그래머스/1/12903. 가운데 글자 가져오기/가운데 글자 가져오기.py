import math

def solution(s):
    midnum = math.floor(len(s) / 2)
    
    if len(s) % 2 == 0:
        return s[midnum-1] + s[midnum]
    else:
        return s[midnum]
