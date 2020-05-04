
def index():
	return "这是主页"

def login():
	return "这是登录页面"

def application(env, start_response):
    start_response('200 OK', [('Content-Type', 'text/html;charset=utf-8')])
    
    file_name = env['PATH_INFO']
    # file_name = "/index.py"

    if file_name == "/index.py":
    	return index()
    elif file_name == "/login.py":
    	return login()
    else:
    	return 'Hello World! 我爱你中国....'