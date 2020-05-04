# def set_func_1(func):
# 	def call_func():
# 		# "<h1>haha</h1>"
# 		return "<h1>" + func() + "</h1>"
# 	return call_func


class Test(object):
	def __init__(self, func):
		self.func = func

	def __call__(self):
		print("这里是装饰器添加的功能.....")
		return self.func()


@Test  # 相当于get_str = Test(get_str)
def get_str():
	return "haha"

print(get_str())