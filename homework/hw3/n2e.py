#!/usr/bin/env python

### Steven Lo, Software Engineering, Homework assignment 3

### n2e (numeric to English)

### accepts a numeric value and returns its English spoken/written equivalent

import sys,re
from collections import deque

if not re.search('^[0-9]+$', sys.argv[1]):
  sys.exit('Argument must be a non-negative integer')

if len(sys.argv[1]) > 33:
  sys.exit('Value too large for this program')

#-------------------------------------------------------------------------------------------------

def numeric_to_english(n):
  'accepts a string digital number, returns a string English equivalent'

  zero_thru_nine = {
    '0': 'Zero',
    '1': 'One',
    '2': 'Two',
    '3': 'Three',
    '4': 'Four',
    '5': 'Five',
    '6': 'Six',
    '7': 'Seven',
    '8': 'Eight',
    '9': 'Nine'
  }
  
  ten_thru_nineteen = {
    '10': 'Ten',
    '11': 'Eleven',
    '12': 'Twelve',
    '13': 'Thirteen',
    '14': 'Fourteen',
    '15': 'Fifteen',
    '16': 'Sixteen',
    '17': 'Seventeen',
    '18': 'Eighteen',
    '19': 'Nineteen'
  }
  
  tys = {
    '2': 'Twenty',
    '3': 'Thirty',
    '4': 'Forty',
    '5': 'Fifty',
    '6': 'Sixty',
    '7': 'Seventy',
    '8': 'Eighty',
    '9': 'Ninety'
  }
  
  zillions = {
    3: 'Thousand',
    6: 'Million',
    9: 'Billion',
    12: 'Trillion',
    15: 'Quadrillion',
    18: 'Quintillion',
    21: 'Sextillion',
    24: 'Septillion',
    27: 'Octillion',
    30: 'Nonillion',
    33: 'Zillion'
  }

  if re.search('^0+$', n):
    return zero_thru_nine['0']

  numeric = deque(n)
  alpha = list()
  digits = str()
  next_digit = str()

  while numeric[0] == '0':
    numeric.popleft()

  length = len(numeric)
  
  while length > 0:
  
    if length % 3 == 0:
      digits = numeric.popleft()
      length = length - 1
      if digits != '0':
        alpha.append(zero_thru_nine[digits])
        alpha.append('Hundred')
    elif length % 3 == 2:
      digits = numeric.popleft()
      length = length - 1
      if digits == '0':
        continue
      elif digits == '1':
        digits += numeric.popleft()
        length = length - 1
        alpha.append(ten_thru_nineteen[digits])
      else:
        next_digit = numeric.popleft()
        length = length - 1
        if next_digit == '0':
          alpha.append(tys[digits])
        else:
          alpha.append(tys[digits] + '-' + zero_thru_nine[next_digit])
    else:
      digits = numeric.popleft()
      length = length - 1
      if digits != '0':
        alpha.append(zero_thru_nine[digits])

    if (length % 3 == 0 and length >= 3):
      alpha.append(zillions[length])

      while numeric[0] == '0':
        numeric.popleft()
        length = length - 1

  return ' '.join(alpha)
#-------------------------------------------------------------------------------------------------

number = sys.argv[1]

print numeric_to_english(number)
