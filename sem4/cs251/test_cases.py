import random
import math
# generate random Gaussian values
from random import seed
from random import gauss
# seed random number generator
seed(1)
def r(n):
    with open("T.txt","a+") as file:
        # appendEOL = True
        file.seek(0)

        for i in range(1,n+1):

            # generate some Gaussian values
            # for _ in range(10):
            # value = gauss(0, 1)
            # print(value)
            if(i%2==0):
                a = int(2147483647 * gauss(0, 0.00000001*math.sqrt(n)))
                b = int(2147483647 * gauss(0, 0.00000001*math.sqrt(n)))

            else:
                #a = random.randint(-2147483648, 2147483647) #- random.randint(-2147483648, 2147483647)
                #b = random.randint(-2147483648, 2147483647)
                a = random.randint(-1000, 1000) #- random.randint(-2147483648, 2147483647)
                b = random.randint(-1000, 1000)
            # a = random.randint(-2147483648, 2147483647) #- random.randint(-2147483648, 2147483647)
            # b = random.randint(-2147483648, 2147483647) #- random.randint(-2147483648, 2147483647)
            # if appendEOL == True:
            # import scipy.stats as ss
            # import numpy as np
            # import matplotlib.pyplot as plt

            # x = np.arange(-2147483648, 2147483647)
            # xU, xL = x + 0.5, x - 0.5
            # prob = ss.norm.cdf(xU, scale = 3) - ss.norm.cdf(xL, scale = 3)
            # prob = prob / prob.sum() # normalize the probabilities so their sum is 1
            # nums = np.random.choice(x, size = 10000, p = prob)
            # # plt.hist(nums, bins = len(x))

            file.write(str(a)+" "+str(b))
            file.write("\n")
            # list.append((a,b))
    return 1

import sys

n = sys.argv[1]
n = int(n)
# print(n)
r(n)
# r(10000)


# return a,b
