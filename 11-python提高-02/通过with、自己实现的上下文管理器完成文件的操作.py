from contextlib import contextmanager

@contextmanager
def my_open(path, mode):
    f = open(path, mode)
    yield f
    f.close()

with my_open('out.txt', 'w') as f:
    f.write("hello , the simplest context manager")