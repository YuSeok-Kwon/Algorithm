def solution(phone_number):
    numlen = len(phone_number) - 4
    return (numlen * '*') + phone_number[-4:]