import multiprocessing
import os
import time


def test():
    while True:
        print("----in 子进程 pid=%d ,父进程的pid=%d---" % (os.getpid(), os.getppid()))
        time.sleep(1)


def test2():
    while True:
        print("----in 子进程2 pid=%d ,父进程的pid=%d---" % (os.getpid(), os.getppid()))
        time.sleep(1)


def main():
    print("----in 主进程 pid=%d---父进程pid=%d----" % (os.getpid(), os.getppid()))
    p = multiprocessing.Process(target=test)
    p.start()

    p2 = multiprocessing.Process(target=test2)
    p2.start()

if __name__ == "__main__":
    main()
