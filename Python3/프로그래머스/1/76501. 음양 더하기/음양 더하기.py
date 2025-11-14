def solution(absolutes, signs):
    result = 0
    
    for i, value in enumerate(signs):
        if value:
            result += absolutes[i]
        else:
            result -= absolutes[i]
    return result