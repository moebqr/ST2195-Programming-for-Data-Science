def magnitude(vec):
    '''
    input: vec is a vector, represented by a list
    output: magnitude of the vector
    '''
    return sum((num**2 for num in vec)) ** 0.5

def distance(vec1, vec2):
    '''
    input: vec1 and vec2 are two vectors with the same length, represented by a list
    output: distance between two vectors
    '''
    return sum(((num1-num2)**2 for num1, num2 in zip(vec1, vec2))) ** 0.5

def add(vec1, vec2):
    '''
    input: vec1 and vec2 are two vectors with the same length, represented by a list
    output: resulting vector after adding vec1 and vec2
    '''
    return (num1+num2 for num1, num2 in zip(vec1, vec2))