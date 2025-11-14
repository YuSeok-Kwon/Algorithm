def solution(absolutes, signs):
    result = 0
    
    for absolute, sign in zip(absolutes, signs):
        if sign:
            result += absolute
        else:
            result -= absolute
    return result