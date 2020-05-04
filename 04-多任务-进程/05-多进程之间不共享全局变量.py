import multiprocessing
import os
import time


nums = [11, 22, 33]


def test():
    nums.append(44)
    print("在进程中1中nums=%s" % str(nums))
    time.sleep(3)


def test2():
    print("在进程中2中nums=%s" % str(nums))


def main():
    print("----in 主进程 pid=%d---父进程pid=%d----" % (os.getpid(), os.getppid()))
    p = multiprocessing.Process(target=test)
    p.start()

    # time.sleep(1)
    p.join()

    p2 = multiprocessing.Process(target=test2)
    p2.start()

if __name__ == "__main__":
    main()
