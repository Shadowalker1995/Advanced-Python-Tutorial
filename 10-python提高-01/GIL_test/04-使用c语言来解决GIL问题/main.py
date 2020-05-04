from ctypes import *
from threading import Thread

#加载动态库
lib = cdll.LoadLibrary("./libdead_loop.so")

#创建一个子线程，让其执行ｃ语言编写的函数，此函数是一个死循环
t = Thread(target=lib.DeadLoop)
t.start()

#主线程
while True:
    pass

