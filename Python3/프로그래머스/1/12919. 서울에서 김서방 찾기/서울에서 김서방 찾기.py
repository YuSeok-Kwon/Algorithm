def solution(seoul):
    for i, value in enumerate(seoul):
        if value == 'Kim':
            return f"김서방은 {i}에 있다"