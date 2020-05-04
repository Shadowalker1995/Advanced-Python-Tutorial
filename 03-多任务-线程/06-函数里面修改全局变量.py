

num = 100
nums = [11, 22]

def test():
    global num

    num += 100

def test2():
    nums.append(33)


print(num)
print(nums)

test()
test2()

print(num)
print(nums)

