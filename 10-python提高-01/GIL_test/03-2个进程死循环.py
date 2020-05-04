import multiprocessing

def deadLoop():
    while True:
        pass

#子进程死循环
p1 = multiprocessing.Process(target=deadLoop)
p1.start()

#主进程死循环
deadLoop()
