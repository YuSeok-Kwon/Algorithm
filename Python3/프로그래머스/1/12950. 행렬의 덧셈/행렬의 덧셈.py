def solution(arr1, arr2):
    answer = []
    for row1, row2 in zip(arr1,arr2):
        temp_list = []
        for num1, num2 in zip(row1, row2):
            temp_list.append(num1 + num2)
        
        answer.append(temp_list)
    return answer

def solution(arr1, arr2):
    return [[num1 + num2 for num1, num2 in zip(row1, row2)] for row1, row2 in zip(arr1, arr2)]