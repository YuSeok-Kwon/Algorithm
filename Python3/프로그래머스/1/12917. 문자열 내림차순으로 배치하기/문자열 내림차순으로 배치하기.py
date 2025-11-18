def solution(s):
    answer = ''
    
    for i in sorted(s, reverse=True):
        answer += ''.join(i)
    return answer