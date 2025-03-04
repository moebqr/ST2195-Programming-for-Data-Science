'''
This module contains functions for circle calculation
'''

pi = 3.14159
def area(radius):
    '''
    return area of a circle given the radius. Radius is assumed to be a non-negative number
    '''
    return pi *(radius**2)

def circumference(radius):
    '''
    return circumference of a circle given the radius. Radius is assumed to be a non-negative number
    '''
    return 2 * pi * radius
    